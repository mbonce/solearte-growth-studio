import SwiftUI

struct RootView: View {
    @State private var selection: AppSection = .commandCenter

    var body: some View {
        TabView(selection: $selection) {
            NavigationStack { DashboardView() }
                .tabItem { Label("Command", systemImage: "square.grid.2x2") }
                .tag(AppSection.commandCenter)

            NavigationStack { ModuleIndexView() }
                .tabItem { Label("Operations", systemImage: "flowchart") }
                .tag(AppSection.operations)

            NavigationStack { AttentionView() }
                .tabItem { Label("Review", systemImage: "tray.full") }
                .tag(AppSection.review)

            NavigationStack { SettingsView() }
                .tabItem { Label("Settings", systemImage: "gearshape") }
                .tag(AppSection.settings)
        }
        .preferredColorScheme(.dark)
    }
}

private enum AppSection { case commandCenter, operations, review, settings }
