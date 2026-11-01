import Foundation
import SwiftUI

enum OpsTheme {
    static let navy = Color(red: 0.035, green: 0.071, blue: 0.125)
    static let panel = Color(red: 0.065, green: 0.105, blue: 0.165)
    static let cyan = Color(red: 0.10, green: 0.82, blue: 0.78)
    static let amber = Color(red: 1.0, green: 0.68, blue: 0.22)
    static let red = Color(red: 0.98, green: 0.34, blue: 0.34)
    static let muted = Color(red: 0.58, green: 0.65, blue: 0.73)
}

enum WorkflowStatus: String, CaseIterable, Identifiable, Codable {
    case attention = "Needs attention"
    case review = "In review"
    case onTrack = "On track"
    case complete = "Complete"

    var id: String { rawValue }
    var color: Color {
        switch self {
        case .attention: OpsTheme.red
        case .review: OpsTheme.amber
        case .onTrack: OpsTheme.cyan
        case .complete: .green
        }
    }
}

enum OpsModule: String, CaseIterable, Identifiable, Codable {
    case suppliers = "Supplier CRM"
    case catalogs = "Catalog Intake"
    case asin = "ASIN Analysis"
    case buyList = "Buy List"
    case purchaseOrders = "Purchase Orders"
    case shipments = "FBA Shipments"
    case replenishment = "Replenishment"
    case risk = "Risk Control"
    case va = "VA Workflow"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .suppliers: "building.2"
        case .catalogs: "doc.text.magnifyingglass"
        case .asin: "barcode.viewfinder"
        case .buyList: "cart"
        case .purchaseOrders: "doc.plaintext"
        case .shipments: "shippingbox"
        case .replenishment: "arrow.triangle.2.circlepath"
        case .risk: "shield.checkered"
        case .va: "person.2"
        }
    }

    var shortName: String {
        switch self {
        case .suppliers: "Suppliers"
        case .catalogs: "Catalogs"
        case .asin: "ASINs"
        case .buyList: "Buy List"
        case .purchaseOrders: "POs"
        case .shipments: "Shipments"
        case .replenishment: "Replenish"
        case .risk: "Risk"
        case .va: "VA Tasks"
        }
    }

    var purpose: String {
        switch self {
        case .suppliers: "Contacts, terms, approvals, and follow-ups"
        case .catalogs: "Catalog ownership and review progress"
        case .asin: "Product assumptions and decision history"
        case .buyList: "Accountable, approved buy decisions"
        case .purchaseOrders: "POs, invoices, and reconciliation"
        case .shipments: "Prep, inbound tracking, and exceptions"
        case .replenishment: "Reorder timing and decision logic"
        case .risk: "Restrictions, invoices, and review notes"
        case .va: "Auditable work, reviews, and blockers"
        }
    }
}

struct OpsRecord: Identifiable, Hashable {
    let id: UUID
    let module: OpsModule
    var title: String
    var subtitle: String
    var owner: String
    var status: WorkflowStatus
    var value: String
    var dueLabel: String
    var note: String

    init(id: UUID = UUID(), module: OpsModule, title: String, subtitle: String, owner: String, status: WorkflowStatus, value: String, dueLabel: String, note: String) {
        self.id = id
        self.module = module
        self.title = title
        self.subtitle = subtitle
        self.owner = owner
        self.status = status
        self.value = value
        self.dueLabel = dueLabel
        self.note = note
    }
}

struct ActivityItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let detail: String
    let time: String
    let color: Color
}
