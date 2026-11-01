import SwiftUI

@main
struct GrowthStudioApp: App {
    @State private var studio = StudioStore()

    var body: some Scene {
        WindowGroup {
            StudioRootView()
                .environment(studio)
                .preferredColorScheme(.dark)
                .tint(StudioTheme.lime)
                .frame(minWidth: 1080, minHeight: 680)
        }
        .defaultSize(width: 1320, height: 820)
        .windowStyle(.hiddenTitleBar)
    }
}
