import Foundation
import SwiftUI

enum StudioTheme {
    static let background = Color(red: 0.025, green: 0.035, blue: 0.045)
    static let surface = Color(red: 0.055, green: 0.070, blue: 0.080)
    static let raised = Color(red: 0.075, green: 0.092, blue: 0.102)
    static let lime = Color(red: 0.68, green: 0.93, blue: 0.28)
    static let cyan = Color(red: 0.20, green: 0.78, blue: 0.92)
    static let amber = Color(red: 1.00, green: 0.65, blue: 0.20)
    static let red = Color(red: 0.96, green: 0.31, blue: 0.34)
    static let muted = Color(red: 0.57, green: 0.62, blue: 0.65)
}

enum StudioSection: String, CaseIterable, Identifiable {
    case overview = "Command Center"
    case production = "Production"
    case agents = "Agent Team"
    case approvals = "Approvals"
    case library = "Studio Library"
    case analytics = "Analytics"

    var id: String { rawValue }
    var icon: String {
        switch self {
        case .overview: "command"
        case .production: "rectangle.3.group"
        case .agents: "person.3"
        case .approvals: "checkmark.seal"
        case .library: "square.grid.3x3"
        case .analytics: "chart.xyaxis.line"
        }
    }
}

struct ActiveAgent: Codable, Identifiable, Hashable {
    var id: String { taskId }
    let agent: String
    let taskId: String
    let status: String
    let heartbeatAt: String
    let riskLevel: Int
    let outputPath: String

    enum CodingKeys: String, CodingKey {
        case agent, status
        case taskId = "task_id"
        case heartbeatAt = "heartbeat_at"
        case riskLevel = "risk_level"
        case outputPath = "output_path"
    }
}

struct QueueItem: Codable, Identifiable, Hashable {
    var id: String { taskId }
    let taskId: String
    let owner: String
    let status: String
    let notes: String

    enum CodingKeys: String, CodingKey {
        case owner, status, notes
        case taskId = "task_id"
    }
}

struct ApprovalItem: Codable, Identifiable, Hashable {
    var id: String { asset + status }
    let asset: String
    let status: String
    let requiredCheck: String

    enum CodingKeys: String, CodingKey {
        case asset, status
        case requiredCheck = "required_check"
    }
}

struct LoopState: Codable {
    let loopMode: String
    let lastTickAt: String
    let nextTickDueAt: String
    let minimumActiveAgents: Int
    let activeAgents: [ActiveAgent]
    let readyQueue: [QueueItem]
    let qaQueue: [ApprovalItem]

    enum CodingKeys: String, CodingKey {
        case loopMode = "loop_mode"
        case lastTickAt = "last_tick_at"
        case nextTickDueAt = "next_tick_due_at"
        case minimumActiveAgents = "minimum_active_agents"
        case activeAgents = "active_agents"
        case readyQueue = "ready_queue"
        case qaQueue = "qa_queue"
    }
}

struct StudioTask: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let owner: String
    let status: String
    let due: String
    let output: String
    let notes: String
}

struct AgentRole: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let role: String
    let priority: String
    let approval: String
}

enum LibraryGroup: String, CaseIterable, Identifiable {
    case content = "Content"
    case instagram = "Instagram"
    case research = "Research & VOC"
    case outbound = "Outbound"
    case sales = "Sales"
    case launch = "Launch"
    case analytics = "Analytics"
    case workflows = "Workflows"

    var id: String { rawValue }
    var folders: [String] {
        switch self {
        case .content: ["content", "creative-research", "swipe-files"]
        case .instagram: ["instagram"]
        case .research: ["research", "audience-research", "voice-of-customer", "competitors"]
        case .outbound: ["outbound"]
        case .sales: ["sales", "lead-magnets", "website"]
        case .launch: ["launch", "agent-ops"]
        case .analytics: ["analytics"]
        case .workflows: ["workflows", "automations", "templates"]
        }
    }
    var icon: String {
        switch self {
        case .content: "paintbrush.pointed"
        case .instagram: "camera"
        case .research: "binoculars"
        case .outbound: "paperplane"
        case .sales: "briefcase"
        case .launch: "rocket"
        case .analytics: "chart.bar.xaxis"
        case .workflows: "gearshape.2"
        }
    }
}

struct StudioDocument: Identifiable, Hashable {
    var id: String { relativePath }
    let name: String
    let relativePath: String
    let group: LibraryGroup
    let modifiedAt: Date
    let fileSize: Int64
    let kind: String
}
