import XCTest
@testable import WholesaleOps

@MainActor
final class OperationsStoreTests: XCTestCase {
    func testEveryDocumentedModuleIsRepresented() {
        XCTAssertEqual(OpsModule.allCases.count, 9)
        let store = OperationsStore()
        for module in OpsModule.allCases {
            XCTAssertGreaterThan(store.count(for: module), 0, "Missing demo record for \(module.rawValue)")
        }
    }

    func testFilteringCombinesModuleStatusAndSearch() {
        let store = OperationsStore()
        store.selectedStatus = .attention
        store.searchText = "Northstar"
        let results = store.records(for: .suppliers)
        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results.first?.title, "Northstar Distribution")
    }

    func testWorkflowAdvancesWithoutSkippingState() {
        let store = OperationsStore()
        let record = store.records.first { $0.status == .attention }!
        store.advance(record)
        XCTAssertEqual(store.records.first { $0.id == record.id }?.status, .review)
    }
}
