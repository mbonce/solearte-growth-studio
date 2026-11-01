import Foundation
import Observation

@MainActor
@Observable
final class StudioStore {
    var selectedSection: StudioSection? = .overview
    var selectedGroup: LibraryGroup = .content
    var selectedDocument: StudioDocument?
    var loopState: LoopState?
    var tasks: [StudioTask] = []
    var agentRoles: [AgentRole] = []
    var documents: [StudioDocument] = []
    var searchText = ""
    var lastRefresh = Date()
    var loadError: String?
    let repositoryURL: URL

    init() {
        repositoryURL = Self.resolveRepositoryURL()
        refresh()
    }

    func refresh() {
        do {
            loopState = try decode(LoopState.self, at: "agent-ops/loop-state.json")
            tasks = try parseTasks(at: "agent-ops/task-queue.md")
            agentRoles = try parseAgents(at: "agent-ops/agent-roster.md")
            documents = scanDocuments()
            lastRefresh = Date()
            loadError = nil
        } catch {
            loadError = error.localizedDescription
        }
    }

    func text(for document: StudioDocument) -> String {
        let url = repositoryURL.appending(path: document.relativePath)
        return (try? String(contentsOf: url, encoding: .utf8)) ?? "Preview is unavailable for this file type."
    }

    func documents(in group: LibraryGroup) -> [StudioDocument] {
        documents.filter { document in
            document.group == group && (searchText.isEmpty || document.name.localizedCaseInsensitiveContains(searchText) || document.relativePath.localizedCaseInsensitiveContains(searchText))
        }
    }

    var approvalCounts: (human: Int, ready: Int, other: Int) {
        let approvals = loopState?.qaQueue ?? []
        let human = approvals.filter { $0.status.localizedCaseInsensitiveContains("human") }.count
        let ready = approvals.filter { $0.status.localizedCaseInsensitiveContains("approved") || $0.status.localizedCaseInsensitiveContains("ready") }.count
        return (human, ready, max(0, approvals.count - human - ready))
    }

    private func decode<T: Decodable>(_ type: T.Type, at path: String) throws -> T {
        let data = try Data(contentsOf: repositoryURL.appending(path: path))
        return try JSONDecoder().decode(type, from: data)
    }

    private func parseTasks(at path: String) throws -> [StudioTask] {
        let text = try String(contentsOf: repositoryURL.appending(path: path), encoding: .utf8)
        return tableRows(in: text, minimumColumns: 7).compactMap { cells in
            guard !cells[0].contains("Task"), !cells[0].allSatisfy({ $0 == "-" }) else { return nil }
            return StudioTask(title: cells[0], owner: cells[1], status: cells[2], due: cells[3], output: cells[4], notes: cells[6])
        }
    }

    private func parseAgents(at path: String) throws -> [AgentRole] {
        let text = try String(contentsOf: repositoryURL.appending(path: path), encoding: .utf8)
        return tableRows(in: text, minimumColumns: 7).compactMap { cells in
            guard !cells[0].contains("Agent"), !cells[0].allSatisfy({ $0 == "-" }) else { return nil }
            return AgentRole(name: cells[0], role: cells[1], priority: cells[5], approval: cells[6])
        }
    }

    private func tableRows(in text: String, minimumColumns: Int) -> [[String]] {
        text.split(separator: "\n").compactMap { line in
            guard line.hasPrefix("|") else { return nil }
            let cells = line.split(separator: "|", omittingEmptySubsequences: false).dropFirst().dropLast().map { $0.trimmingCharacters(in: .whitespaces) }
            return cells.count >= minimumColumns ? cells : nil
        }
    }

    private func scanDocuments() -> [StudioDocument] {
        var output: [StudioDocument] = []
        let manager = FileManager.default
        for group in LibraryGroup.allCases {
            for folder in group.folders {
                let folderURL = repositoryURL.appending(path: folder)
                guard let enumerator = manager.enumerator(at: folderURL, includingPropertiesForKeys: [.contentModificationDateKey, .fileSizeKey, .isRegularFileKey], options: [.skipsHiddenFiles]) else { continue }
                for case let url as URL in enumerator {
                    guard ["md", "json", "svg", "png"].contains(url.pathExtension.lowercased()),
                          let values = try? url.resourceValues(forKeys: [.contentModificationDateKey, .fileSizeKey, .isRegularFileKey]),
                          values.isRegularFile == true else { continue }
                    let relative = url.path.replacingOccurrences(of: repositoryURL.path + "/", with: "")
                    output.append(.init(name: url.deletingPathExtension().lastPathComponent.replacingOccurrences(of: "-", with: " ").capitalized, relativePath: relative, group: group, modifiedAt: values.contentModificationDate ?? .distantPast, fileSize: Int64(values.fileSize ?? 0), kind: url.pathExtension.uppercased()))
                }
            }
        }
        return output.sorted { $0.modifiedAt > $1.modifiedAt }
    }

    private static func resolveRepositoryURL() -> URL {
        let adjacent = Bundle.main.bundleURL.deletingLastPathComponent()
        if FileManager.default.fileExists(atPath: adjacent.appending(path: "agent-ops/loop-state.json").path) { return adjacent }
        let known = FileManager.default.homeDirectoryForCurrentUser.appending(path: "Documents/wholesale-ops-growth-studio")
        if FileManager.default.fileExists(atPath: known.path) { return known }
        return URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    }
}
