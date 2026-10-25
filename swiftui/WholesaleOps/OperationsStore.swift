import Foundation
import Observation

@MainActor
@Observable
final class OperationsStore {
    var records: [OpsRecord]
    var selectedStatus: WorkflowStatus?
    var searchText = ""
    var completedTaskIDs: Set<UUID> = []

    init(records: [OpsRecord] = OperationsStore.demoRecords) {
        self.records = records
    }

    func records(for module: OpsModule) -> [OpsRecord] {
        records.filter { record in
            record.module == module &&
            (selectedStatus == nil || record.status == selectedStatus) &&
            (searchText.isEmpty || record.title.localizedCaseInsensitiveContains(searchText) || record.subtitle.localizedCaseInsensitiveContains(searchText))
        }
    }

    func count(for module: OpsModule) -> Int {
        records.filter { $0.module == module }.count
    }

    func attentionRecords(limit: Int? = nil) -> [OpsRecord] {
        let result = records.filter { $0.status == .attention || $0.status == .review }
        return limit.map { Array(result.prefix($0)) } ?? result
    }

    func advance(_ record: OpsRecord) {
        guard let index = records.firstIndex(where: { $0.id == record.id }) else { return }
        switch records[index].status {
        case .attention: records[index].status = .review
        case .review: records[index].status = .onTrack
        case .onTrack: records[index].status = .complete
        case .complete: break
        }
    }

    func toggleTask(_ record: OpsRecord) {
        if completedTaskIDs.contains(record.id) {
            completedTaskIDs.remove(record.id)
        } else {
            completedTaskIDs.insert(record.id)
        }
    }

    static let demoRecords: [OpsRecord] = [
        .init(module: .suppliers, title: "Northstar Distribution", subtitle: "Health & Personal Care", owner: "Maya", status: .attention, value: "Follow-up", dueLabel: "Today", note: "Confirm updated terms and request the June catalog."),
        .init(module: .suppliers, title: "Apex Brands", subtitle: "Home & Kitchen", owner: "Luis", status: .onTrack, value: "Approved", dueLabel: "Jun 24", note: "Account approved; catalog review is assigned."),
        .init(module: .suppliers, title: "Harbor Wholesale", subtitle: "Grocery", owner: "Sam", status: .review, value: "Terms review", dueLabel: "Tomorrow", note: "MOQ and freight assumptions require operator review."),
        .init(module: .catalogs, title: "Northstar — June 2026", subtitle: "1,284 supplier SKUs", owner: "Priya", status: .review, value: "68%", dueLabel: "Today", note: "Second-pass ASIN matching is in progress."),
        .init(module: .catalogs, title: "Apex — Summer Line", subtitle: "642 supplier SKUs", owner: "Luis", status: .onTrack, value: "42%", dueLabel: "Jun 25", note: "Initial normalization complete."),
        .init(module: .asin, title: "B0D7OPS241", subtitle: "Northstar / NS-4418", owner: "Priya", status: .attention, value: "ROI 31%", dueLabel: "Today", note: "Fee assumption changed; re-open the buy decision."),
        .init(module: .asin, title: "B0C9FBA114", subtitle: "Apex / AX-9031", owner: "Maya", status: .onTrack, value: "ROI 27%", dueLabel: "Reviewed", note: "Decision notes and cost assumptions are current."),
        .init(module: .buyList, title: "June Week 3 Buy", subtitle: "18 approved ASINs", owner: "Mike", status: .review, value: "$24,860", dueLabel: "Today", note: "Two quantities still require owner approval."),
        .init(module: .purchaseOrders, title: "PO-2026-184", subtitle: "Apex Brands", owner: "Maya", status: .onTrack, value: "$12,440", dueLabel: "Jun 26", note: "Invoice matched; awaiting supplier confirmation."),
        .init(module: .purchaseOrders, title: "PO-2026-179", subtitle: "Harbor Wholesale", owner: "Sam", status: .attention, value: "$8,210", dueLabel: "Overdue", note: "Received quantity differs from the invoice."),
        .init(module: .shipments, title: "FBA18KD92Q", subtitle: "PO-2026-171 · 436 units", owner: "Luis", status: .attention, value: "12 short", dueLabel: "Today", note: "Reconcile received-unit exception."),
        .init(module: .shipments, title: "FBA18KC77M", subtitle: "PO-2026-169 · 280 units", owner: "Maya", status: .onTrack, value: "In transit", dueLabel: "Jun 23", note: "Carrier tracking is recorded for the next review."),
        .init(module: .replenishment, title: "B0C9FBA114", subtitle: "22 days of cover", owner: "Mike", status: .review, value: "120 units", dueLabel: "Tomorrow", note: "Review velocity and current cost before reorder."),
        .init(module: .replenishment, title: "B08WHL550", subtitle: "11 days of cover", owner: "Priya", status: .attention, value: "80 units", dueLabel: "Today", note: "Below reorder point; margin assumption needs refresh."),
        .init(module: .risk, title: "Restricted-brand review", subtitle: "B0D7OPS241 · Northstar", owner: "Mike", status: .attention, value: "Human review", dueLabel: "Today", note: "Confirm documentation and current restriction status. This is workflow hygiene, not compliance advice."),
        .init(module: .risk, title: "Invoice documentation", subtitle: "PO-2026-184 · Apex", owner: "Maya", status: .onTrack, value: "Attached", dueLabel: "Reviewed", note: "Invoice and authorization notes are linked to the decision."),
        .init(module: .va, title: "Normalize Northstar catalog", subtitle: "Catalog intake", owner: "Priya", status: .review, value: "68%", dueLabel: "Today", note: "Awaiting reviewer comments on duplicate supplier SKUs."),
        .init(module: .va, title: "Reconcile FBA18KD92Q", subtitle: "Shipment exception", owner: "Luis", status: .attention, value: "Blocked", dueLabel: "Today", note: "Needs receiving report before work can continue.")
    ]
}
