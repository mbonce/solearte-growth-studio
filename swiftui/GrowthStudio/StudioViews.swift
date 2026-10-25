import SwiftUI

struct ProductionView: View {
    @Environment(StudioStore.self) private var studio
    @State private var statusFilter = "Active"
    private let filters = ["Active", "Needs review", "Ready", "Complete", "All"]

    var filtered: [StudioTask] {
        switch statusFilter {
        case "Active": studio.tasks.filter { $0.status.localizedCaseInsensitiveContains("progress") }
        case "Needs review": studio.tasks.filter { $0.status.localizedCaseInsensitiveContains("QA") || $0.status.localizedCaseInsensitiveContains("human") || $0.status.localizedCaseInsensitiveContains("revision") }
        case "Ready": studio.tasks.filter { $0.status.localizedCaseInsensitiveContains("ready") }
        case "Complete": studio.tasks.filter { $0.status.localizedCaseInsensitiveContains("complete") }
        default: studio.tasks
        }
    }

    var body: some View {
        ZStack { StudioBackground(); VStack(alignment: .leading, spacing: 18) {
            StudioHeader(eyebrow: "Production desk", title: "Work Pipeline", subtitle: "Live tasks parsed from agent-ops/task-queue.md")
            Picker("Status", selection: $statusFilter) { ForEach(filters, id: \.self) { Text($0) } }.pickerStyle(.segmented).frame(maxWidth: 620)
            List(filtered) { task in
                HStack(alignment: .top, spacing: 14) {
                    RoundedRectangle(cornerRadius: 3).fill(statusColor(task.status)).frame(width: 5, height: 48)
                    VStack(alignment: .leading, spacing: 5) { Text(task.title).font(.headline); Text(task.output).font(.caption).foregroundStyle(.secondary).lineLimit(1); Text(task.notes).font(.caption2).foregroundStyle(StudioTheme.muted).lineLimit(2) }
                    Spacer(); VStack(alignment: .trailing, spacing: 7) { StudioBadge(text: task.status, color: statusColor(task.status)); Text(task.owner).font(.caption).foregroundStyle(.secondary).lineLimit(1); Text(task.due).font(.caption2).foregroundStyle(StudioTheme.muted) }
                }.padding(.vertical, 7).listRowBackground(StudioTheme.surface)
            }.scrollContentBackground(.hidden)
        }.padding(26) }
    }
}

struct AgentTeamView: View {
    @Environment(StudioStore.self) private var studio
    private let columns = [GridItem(.adaptive(minimum: 280), spacing: 12)]
    var body: some View {
        ZStack { StudioBackground(); ScrollView { VStack(alignment: .leading, spacing: 22) {
            StudioHeader(eyebrow: "Specialist network", title: "Agent Team", subtitle: "The studio’s real roster, priorities, and current assignments")
            SafetyBanner()
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(studio.agentRoles) { role in
                    let active = studio.loopState?.activeAgents.first { $0.agent == role.name || $0.agent.contains(role.name.replacingOccurrences(of: "FBA ", with: "")) }
                    VStack(alignment: .leading, spacing: 11) {
                        HStack { Image(systemName: "person.crop.square.filled.and.at.rectangle").foregroundStyle(active == nil ? StudioTheme.muted : StudioTheme.lime); Spacer(); StudioBadge(text: active == nil ? role.priority : "Active", color: active == nil ? StudioTheme.cyan : StudioTheme.lime) }
                        Text(role.name).font(.headline)
                        Text(role.role).font(.caption).foregroundStyle(.secondary).lineLimit(3)
                        Spacer(minLength: 3)
                        if let active { Divider(); Text(active.taskId.replacingOccurrences(of: "-", with: " ").capitalized).font(.caption2).foregroundStyle(StudioTheme.lime).lineLimit(2) }
                        Text(role.approval).font(.caption2).foregroundStyle(StudioTheme.muted).lineLimit(2)
                    }.frame(maxWidth: .infinity, minHeight: 150, alignment: .topLeading).padding(16).background(StudioTheme.surface, in: RoundedRectangle(cornerRadius: 16))
                }
            }
        }.padding(26) } }
    }
}

struct ApprovalsView: View {
    @Environment(StudioStore.self) private var studio
    @State private var selected: ApprovalItem?
    var body: some View {
        ZStack { StudioBackground(); VStack(alignment: .leading, spacing: 18) {
            StudioHeader(eyebrow: "Human control plane", title: "QA & Founder Approvals", subtitle: "Nothing reaches the market without passing the documented gates")
            HStack(spacing: 12) {
                StudioMetric(title: "Human review", value: "\(studio.approvalCounts.human)", detail: "Mike decision required", icon: "person.badge.clock", color: StudioTheme.amber)
                StudioMetric(title: "Internal ready", value: "\(studio.approvalCounts.ready)", detail: "Still not external approval", icon: "checkmark.circle", color: StudioTheme.lime)
                StudioMetric(title: "Other QA states", value: "\(studio.approvalCounts.other)", detail: "Revision or classification", icon: "arrow.triangle.2.circlepath", color: StudioTheme.cyan)
            }
            HSplitView {
                List(studio.loopState?.qaQueue ?? [], selection: $selected) { item in
                    VStack(alignment: .leading, spacing: 6) { HStack { Text(URL(fileURLWithPath: item.asset).lastPathComponent).font(.subheadline.weight(.semibold)); Spacer(); StudioBadge(text: item.status, color: statusColor(item.status)) }; Text(item.asset).font(.caption2).foregroundStyle(.secondary).lineLimit(1) }.padding(.vertical, 6).tag(item).listRowBackground(StudioTheme.surface)
                }.scrollContentBackground(.hidden).frame(minWidth: 480)
                Group { if let selected { VStack(alignment: .leading, spacing: 16) { StudioBadge(text: selected.status, color: statusColor(selected.status)); Text(URL(fileURLWithPath: selected.asset).lastPathComponent).font(.title2.bold()); Text(selected.asset).font(.caption).foregroundStyle(.secondary); Divider(); Text("Required check").font(.headline); Text(selected.requiredCheck).foregroundStyle(.secondary); Spacer(); SafetyBanner() }.padding(22) } else { ContentUnavailableView("Select an approval", systemImage: "checkmark.seal", description: Text("Review the gate and required check.")) } }.frame(minWidth: 380)
            }
        }.padding(26) }
    }
}

struct StudioLibraryView: View {
    @Environment(StudioStore.self) private var studio
    var body: some View {
        @Bindable var studio = studio
        HSplitView {
            VStack(alignment: .leading, spacing: 12) {
                Text("STUDIO LIBRARY").font(.caption.weight(.black)).foregroundStyle(StudioTheme.lime).padding(.horizontal, 14).padding(.top, 16)
                List(LibraryGroup.allCases, selection: $studio.selectedGroup) { group in Label(group.rawValue, systemImage: group.icon).tag(group) }.scrollContentBackground(.hidden)
            }.frame(minWidth: 190, idealWidth: 210).background(StudioTheme.surface)
            VStack(spacing: 0) {
                HStack { Text(studio.selectedGroup.rawValue).font(.title2.bold()); Spacer(); Text("\(studio.documents(in: studio.selectedGroup).count) files").font(.caption).foregroundStyle(.secondary) }.padding(18)
                List(studio.documents(in: studio.selectedGroup), selection: $studio.selectedDocument) { doc in
                    HStack { Image(systemName: doc.group.icon).foregroundStyle(StudioTheme.lime).frame(width: 24); VStack(alignment: .leading, spacing: 3) { Text(doc.name).font(.subheadline.weight(.medium)); Text(doc.relativePath).font(.caption2).foregroundStyle(.secondary) }; Spacer(); Text(doc.kind).font(.caption2.monospaced()).foregroundStyle(StudioTheme.muted) }.padding(.vertical, 5).tag(doc).listRowBackground(StudioTheme.background)
                }.searchable(text: $studio.searchText).scrollContentBackground(.hidden)
            }.frame(minWidth: 360)
            DocumentReaderView(document: studio.selectedDocument)
                .frame(minWidth: 420)
        }.background(StudioTheme.background)
    }
}

struct DocumentReaderView: View {
    @Environment(StudioStore.self) private var studio
    let document: StudioDocument?
    var body: some View {
        if let document {
            VStack(alignment: .leading, spacing: 12) { HStack { VStack(alignment: .leading) { Text(document.name).font(.title2.bold()); Text(document.relativePath).font(.caption).foregroundStyle(.secondary) }; Spacer(); StudioBadge(text: document.kind, color: StudioTheme.cyan) }.padding([.horizontal, .top], 18); Divider(); ScrollView { Text(studio.text(for: document)).font(.system(.body, design: .monospaced)).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .topLeading).padding(20) } }
                .background(StudioTheme.surface)
        } else { ContentUnavailableView("Choose a studio asset", systemImage: "doc.richtext", description: Text("Browse live content, research, sales, and launch files.")) }
    }
}

struct AnalyticsView: View {
    @Environment(StudioStore.self) private var studio
    private let columns = [GridItem(.adaptive(minimum: 180), spacing: 12)]
    var body: some View {
        ZStack { StudioBackground(); ScrollView { VStack(alignment: .leading, spacing: 22) {
            StudioHeader(eyebrow: "Learning loop", title: "Agency Analytics", subtitle: "Current repository evidence—not invented campaign results")
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(LibraryGroup.allCases) { group in StudioMetric(title: group.rawValue, value: "\(studio.documents(in: group).count)", detail: "Repository artifacts", icon: group.icon, color: group == .analytics ? StudioTheme.lime : StudioTheme.cyan) }
            }
            VStack(alignment: .leading, spacing: 12) { Text("Measurement posture").font(.title3.bold()); Text("The repository contains reporting templates and learning logs, but no verified external publishing or response metrics. The app therefore reports production evidence and queue state without turning blanks into performance claims.").foregroundStyle(.secondary); Divider(); ForEach(studio.documents(in: .analytics).prefix(12)) { doc in HStack { Image(systemName: "chart.bar.doc.horizontal").foregroundStyle(StudioTheme.lime); Text(doc.name); Spacer(); Text(doc.modifiedAt.formatted(date: .abbreviated, time: .omitted)).font(.caption).foregroundStyle(.secondary) }.padding(.vertical, 3) } }.padding(18).background(StudioTheme.surface, in: RoundedRectangle(cornerRadius: 16))
        }.padding(26) } }
    }
}
