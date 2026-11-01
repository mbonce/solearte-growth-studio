import SwiftUI

struct CommandCenterView: View {
    @Environment(StudioStore.self) private var studio
    private let columns = [GridItem(.adaptive(minimum: 180), spacing: 12)]

    var body: some View {
        ZStack {
            StudioBackground()
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    StudioHeader(eyebrow: "Always-on agency", title: "Marketing Command Center", subtitle: "Research → messaging → content & outbound → sales → analytics → QA")
                    SafetyBanner()
                    metrics
                    activeWork
                    readyQueue
                    recentAssets
                }.padding(26)
            }
        }
    }

    private var metrics: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            StudioMetric(title: "Active agents", value: "\(studio.loopState?.activeAgents.count ?? 0)", detail: "Minimum \(studio.loopState?.minimumActiveAgents ?? 2) required", icon: "person.3.fill", color: StudioTheme.lime)
            StudioMetric(title: "Founder approvals", value: "\(studio.approvalCounts.human)", detail: "External use remains gated", icon: "checkmark.seal", color: StudioTheme.amber)
            StudioMetric(title: "Ready tasks", value: "\(studio.loopState?.readyQueue.count ?? 0)", detail: "Queued for internal production", icon: "tray.full", color: StudioTheme.cyan)
            StudioMetric(title: "Studio assets", value: "\(studio.documents.count)", detail: "Live files across 8 workstreams", icon: "square.stack.3d.up", color: .purple)
        }
    }

    private var activeWork: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle("Active production lanes", count: studio.loopState?.activeAgents.count ?? 0)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 280), spacing: 12)], spacing: 12) {
                ForEach(studio.loopState?.activeAgents ?? []) { agent in
                    VStack(alignment: .leading, spacing: 12) {
                        HStack { StudioBadge(text: agent.status, color: StudioTheme.lime); Spacer(); Text("R\(agent.riskLevel)").font(.caption2.monospacedDigit()).foregroundStyle(.secondary) }
                        Text(agent.agent).font(.headline)
                        Text(agent.taskId.replacingOccurrences(of: "-", with: " ").capitalized).font(.subheadline).foregroundStyle(.secondary).lineLimit(2)
                        Divider().overlay(.white.opacity(0.08))
                        Label(agent.outputPath, systemImage: "doc.text").font(.caption2).foregroundStyle(StudioTheme.muted).lineLimit(1)
                    }.padding(16).background(StudioTheme.surface, in: RoundedRectangle(cornerRadius: 16))
                }
            }
        }
    }

    private var readyQueue: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle("Next up", count: studio.loopState?.readyQueue.count ?? 0)
            VStack(spacing: 0) {
                ForEach(studio.loopState?.readyQueue ?? []) { item in
                    HStack(spacing: 12) {
                        Image(systemName: "circle.dotted").foregroundStyle(StudioTheme.cyan)
                        VStack(alignment: .leading, spacing: 3) { Text(item.taskId.replacingOccurrences(of: "-", with: " ").capitalized).font(.subheadline.weight(.semibold)); Text(item.owner).font(.caption).foregroundStyle(.secondary) }
                        Spacer(); StudioBadge(text: item.status, color: statusColor(item.status))
                    }.padding(14)
                    if item.id != studio.loopState?.readyQueue.last?.id { Divider().overlay(.white.opacity(0.06)) }
                }
            }.background(StudioTheme.surface, in: RoundedRectangle(cornerRadius: 16))
        }
    }

    private var recentAssets: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle("Latest studio output", count: min(6, studio.documents.count))
            ForEach(studio.documents.prefix(6)) { document in
                HStack { Image(systemName: document.group.icon).foregroundStyle(StudioTheme.lime).frame(width: 24); VStack(alignment: .leading) { Text(document.name).font(.subheadline.weight(.medium)); Text(document.relativePath).font(.caption2).foregroundStyle(.secondary) }; Spacer(); Text(document.kind).font(.caption2.monospaced()).foregroundStyle(StudioTheme.muted) }
                    .padding(.vertical, 3)
            }
        }.padding(17).background(StudioTheme.surface, in: RoundedRectangle(cornerRadius: 16))
    }

    private func sectionTitle(_ title: String, count: Int) -> some View {
        HStack { Text(title).font(.title3.bold()); Text("\(count)").font(.caption.weight(.bold)).foregroundStyle(StudioTheme.lime).padding(.horizontal, 8).padding(.vertical, 3).background(StudioTheme.lime.opacity(0.1), in: Capsule()); Spacer() }
    }
}
