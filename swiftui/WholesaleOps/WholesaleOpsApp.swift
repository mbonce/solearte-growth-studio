import SwiftUI

@main
struct WholesaleOpsApp: App {
    @State private var store = OperationsStore()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(store)
                .tint(OpsTheme.cyan)
        }
    }
}
