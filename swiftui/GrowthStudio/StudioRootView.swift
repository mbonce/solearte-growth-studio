import SwiftUI

struct StudioRootView: View {
    @Environment(StudioStore.self) private var studio

    var body: some View {
        @Bindable var studio = studio
        NavigationSplitView {
            VStack(spacing: 0) {
                brand
                List(StudioSection.allCases, selection: $studio.selectedSection) { section in
                    Label(section.rawValue, systemImage: section.icon).tag(section)
                        .font(.subheadline.weight(.medium)).padding(.vertical, 5)
                }.scrollContentBackground(.hidden)
                repositoryStatus
            }
            .background(StudioTheme.surface)
            .navigationSplitViewColumnWidth(min: 210, ideal: 238, max: 270)
        } detail: {
            Group {
                switch studio.selectedSection ?? .overview {
                case .overview: CommandCenterView()
                case .production: ProductionView()
                case .agents: AgentTeamView()
                case .approvals: ApprovalsView()
                case .library: StudioLibraryView()
                case .analytics: AnalyticsView()
                }
            }
            .toolbar {
                ToolbarItem {
                    Button { studio.refresh() } label: { Label("Refresh repository", systemImage: "arrow.clockwise") }
                }
            }
        }
    }

    private var brand: some View {
        HStack(spacing: 11) {
            Image("GrowthStudioLogo")
                .resizable()
                .scaledToFill()
                .frame(width: 42, height: 42)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading, spacing: 1) {
                Text("GROWTH STUDIO").font(.caption.weight(.black)).tracking(1)
                Text("Wholesale-Ops Agency").font(.caption2).foregroundStyle(.secondary)
            }
            Spacer()
        }.padding(18)
    }

    private var repositoryStatus: some View {
        VStack(alignment: .leading, spacing: 7) {
            HStack { Circle().fill(studio.loadError == nil ? StudioTheme.lime : StudioTheme.red).frame(width: 7, height: 7); Text(studio.loadError == nil ? "Repository connected" : "Load error").font(.caption.weight(.semibold)) }
            Text(studio.repositoryURL.path).font(.caption2).foregroundStyle(.secondary).lineLimit(2)
            Text("Refreshed \(studio.lastRefresh.formatted(date: .omitted, time: .shortened))").font(.caption2).foregroundStyle(StudioTheme.muted)
        }.padding(16).background(Color.black.opacity(0.18))
    }
}
