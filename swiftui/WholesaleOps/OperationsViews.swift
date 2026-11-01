import SwiftUI

struct ModuleIndexView: View {
    var body: some View {
        ZStack {
            PageBackground()
            List(OpsModule.allCases) { module in
                NavigationLink { ModuleDetailView(module: module) } label: {
                    Label {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(module.rawValue).font(.headline)
                            Text(module.purpose).font(.caption).foregroundStyle(.secondary)
                        }
                    } icon: {
                        Image(systemName: module.icon).foregroundStyle(OpsTheme.cyan).frame(width: 28)
                    }
                    .padding(.vertical, 7)
                }
                .listRowBackground(OpsTheme.panel)
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Operations")
    }
}

struct ModuleDetailView: View {
    @Environment(OperationsStore.self) private var store
    let module: OpsModule

    var body: some View {
        @Bindable var store = store
        ZStack {
            PageBackground()
            List {
                Section {
                    Text(module.purpose).font(.subheadline).foregroundStyle(.secondary)
                }
                .listRowBackground(OpsTheme.panel)

                Section {
                    Picker("Status", selection: $store.selectedStatus) {
                        Text("All").tag(WorkflowStatus?.none)
                        ForEach(WorkflowStatus.allCases) { status in Text(status.rawValue).tag(Optional(status)) }
                    }
                    .pickerStyle(.menu)
                }
                .listRowBackground(OpsTheme.panel)

                Section("Records") {
                    if store.records(for: module).isEmpty {
                        ContentUnavailableView("No matching records", systemImage: "line.3.horizontal.decrease.circle", description: Text("Adjust the search or status filter."))
                            .listRowBackground(Color.clear)
                    } else {
                        ForEach(store.records(for: module)) { record in
                            NavigationLink(value: record) { RecordRow(record: record) }
                                .listRowBackground(OpsTheme.panel)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .searchable(text: $store.searchText, prompt: "Search \(module.shortName.lowercased())")
        }
        .navigationTitle(module.rawValue)
        .platformInlineNavigationTitle()
        .navigationDestination(for: OpsRecord.self) { RecordDetailView(recordID: $0.id) }
        .onDisappear {
            store.searchText = ""
            store.selectedStatus = nil
        }
    }
}

struct RecordDetailView: View {
    @Environment(OperationsStore.self) private var store
    let recordID: UUID

    private var record: OpsRecord? { store.records.first { $0.id == recordID } }

    var body: some View {
        ZStack {
            PageBackground()
            if let record {
                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {
                        HStack(alignment: .top) {
                            Image(systemName: record.module.icon)
                                .font(.title2).foregroundStyle(OpsTheme.cyan)
                                .frame(width: 50, height: 50)
                                .background(OpsTheme.cyan.opacity(0.1), in: RoundedRectangle(cornerRadius: 15))
                            VStack(alignment: .leading, spacing: 5) {
                                Text(record.title).font(.title2.bold())
                                Text(record.subtitle).foregroundStyle(.secondary)
                            }
                        }
                        StatusPill(status: record.status)
                        detailGrid(record)
                        VStack(alignment: .leading, spacing: 9) {
                            Text("Decision context").font(.headline)
                            Text(record.note).font(.body).foregroundStyle(.secondary)
                        }
                        .padding(16).background(OpsTheme.panel, in: RoundedRectangle(cornerRadius: 18))
                        Button {
                            store.advance(record)
                        } label: {
                            Label(record.status == .complete ? "Workflow complete" : "Advance workflow", systemImage: "arrow.right.circle.fill")
                                .frame(maxWidth: .infinity).padding(.vertical, 7)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(record.status == .complete)
                        Text("Demo workspace · Decisions and risk notes require human review.")
                            .font(.caption2).foregroundStyle(OpsTheme.muted).frame(maxWidth: .infinity)
                    }
                    .padding(18)
                }
            }
        }
        .navigationTitle(record?.module.shortName ?? "Record")
        .platformInlineNavigationTitle()
    }

    private func detailGrid(_ record: OpsRecord) -> some View {
        Grid(alignment: .leading, horizontalSpacing: 24, verticalSpacing: 14) {
            GridRow { detailCell("Owner", record.owner); detailCell("Value", record.value) }
            GridRow { detailCell("Due", record.dueLabel); detailCell("Module", record.module.shortName) }
        }
        .padding(16).background(OpsTheme.panel, in: RoundedRectangle(cornerRadius: 18))
    }

    private func detailCell(_ label: String, _ value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label.uppercased()).font(.caption2.weight(.bold)).foregroundStyle(OpsTheme.muted)
            Text(value).font(.subheadline.weight(.semibold))
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct AttentionView: View {
    @Environment(OperationsStore.self) private var store

    var body: some View {
        ZStack {
            PageBackground()
            List(store.attentionRecords()) { record in
                NavigationLink(value: record) { RecordRow(record: record) }
                    .listRowBackground(OpsTheme.panel)
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Review Queue")
        .navigationDestination(for: OpsRecord.self) { RecordDetailView(recordID: $0.id) }
    }
}

struct SettingsView: View {
    var body: some View {
        ZStack {
            PageBackground()
            List {
                Section("Workspace") {
                    LabeledContent("Mode", value: "Demo data")
                    LabeledContent("Product", value: "Wholesale-Ops")
                    LabeledContent("Audience", value: "Amazon FBA wholesale")
                }
                Section("Boundaries") {
                    Label("No external integrations are connected", systemImage: "link.badge.plus")
                    Label("Risk items require human review", systemImage: "person.crop.circle.badge.exclamationmark")
                    Text("Wholesale-Ops helps centralize workflow context. It does not guarantee profitable products, prevent account issues, or replace Amazon, legal, tax, or compliance advice.")
                        .font(.caption).foregroundStyle(.secondary)
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Settings")
    }
}
