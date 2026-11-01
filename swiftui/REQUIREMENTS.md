# Growth Studio App Requirement Ledger

Source contract: `README.md`, `launch/always-on-marketing-command-center.md`, `agent-ops/agent-roster.md`, `agent-ops/task-queue.md`, `launch/approval-board.md`, `agent-ops/loop-state.json`, and `analytics/`.

| ID | Requirement | Durable artifact | Verification | Status |
|---|---|---|---|---|
| G1 | Deliver the Growth Studio marketing agency—not the Wholesale-Ops product UI | `Growth Studio.app` | Product name and navigation inspection | Complete |
| G2 | Read live operating state from the repository | Repository loader and refresh action | Active agents/queues match `loop-state.json` | Complete |
| G3 | Show an executive agency command center | Overview dashboard | Rendered-window inspection | Complete |
| G4 | Expose the real agent roster and active assignments | Agents view | Roster and loop-state parsing | Complete |
| G5 | Show the real production task pipeline | Production view | Task queue parsing and filters | Complete |
| G6 | Show QA and founder approval gates | Approvals view | QA queue parsing | Complete |
| G7 | Make studio assets, research, outbound, sales, and analytics browsable | Library and document reader | Directory scan and file selection | Complete |
| G8 | Preserve internal-only and hard-break posture | Persistent safety banner and gate copy | Copy inspection | Complete |
| G9 | Provide a finished universal macOS app | Root `.app` bundle | Release build, signing, architecture, and launch verification | Complete |
| G10 | Preserve source and provide rebuild documentation | `swiftui/GrowthStudio/`, project, README | Clean build and documentation inspection | Complete |

Done means all ten rows are complete, the repository-backed app is signed and double-clickable, and the rendered app is visually verified.
