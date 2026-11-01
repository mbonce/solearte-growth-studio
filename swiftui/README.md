# Growth Studio SwiftUI App

Native macOS command center for the Wholesale-Ops internal marketing agency. It reads the repository’s current agent loop, task queue, approval queue, roster, content, research, outbound, sales, launch, workflow, and analytics files.

## Use the finished app

Double-click `../Growth Studio.app`. The universal macOS application is already compiled and ad-hoc signed; Xcode is not required.

The app expects to remain next to the repository folders so it can read live state. Use the refresh button after repo files change.

## Develop or rebuild

1. Open `WholesaleOps.xcodeproj` in Xcode.
2. Select the `GrowthStudio` scheme.
3. Run with **⌘R** or build a Release bundle with **Product → Archive**.

Regenerate the project after editing `project.yml`:

```sh
cd swiftui
xcodegen generate
```

Run the release build:

```sh
xcodebuild -project WholesaleOps.xcodeproj -scheme GrowthStudio \
  -configuration Release CODE_SIGNING_ALLOWED=NO build
```

## Scope

The app is a read-only operating surface. It does not post, send DMs or email, schedule content, contact prospects, or bypass QA/founder approval gates.
