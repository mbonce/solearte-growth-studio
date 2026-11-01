import SwiftUI

struct DashboardView: View {
    @Environment(OperationsStore.self) private var store
    private let columns = [GridItem(.adaptive(minimum: 154), spacing: 12)]

    var body: some View {
        ZStack {
            PageBackground()
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    metrics
                    attention
                    modules
                    activity
                }
                .padding(.horizontal, 18)
                .padding(.bottom, 32)
            }
        }
        .platformNavigationChromeHidden()
        .accessibilityIdentifier("dashboard")
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "shippingbox.and.arrow.backward.fill")
                    .foregroundStyle(OpsTheme.cyan)
                    .font(.title2)
                Text("WHOLESALE-OPS").font(.caption.weight(.black)).tracking(1.4)
                Spacer()
                Image(systemName: "person.crop.circle.fill").font(.title2).foregroundStyle(OpsTheme.muted)
            }
            .padding(.top, 10)
            Text("Good morning, Mike").font(.largeTitle.bold())
            Text("Your FBA operation, from supplier to replenishment.")
                .font(.subheadline).foregroundStyle(OpsTheme.muted)
        }
    }

    private var metrics: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
            MetricCard(label: "Needs review", value: "\(store.attentionRecords().count)", detail: "Across the workflow", color: OpsTheme.red)
            MetricCard(label: "Active suppliers", value: "\(store.count(for: .suppliers))", detail: "Demo workspace", color: OpsTheme.cyan)
            MetricCard(label: "Open buy list", value: "$24.9K", detail: "2 approvals pending", color: OpsTheme.amber)
            MetricCard(label: "Inbound units", value: "716", detail: "2 active shipments", color: .blue)
        }
    }

    private var attention: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                SectionHeading("Your attention", eyebrow: "Today")
                NavigationLink("View all") { AttentionView() }.font(.caption.weight(.semibold))
            }
            VStack(spacing: 0) {
                ForEach(store.attentionRecords(limit: 4)) { record in
                    NavigationLink(value: record) { RecordRow(record: record) }
                    if record.id != store.attentionRecords(limit: 4).last?.id { Divider().overlay(.white.opacity(0.08)) }
                }
            }
            .padding(.horizontal, 14)
            .background(OpsTheme.panel, in: RoundedRectangle(cornerRadius: 18))
        }
        .navigationDestination(for: OpsRecord.self) { RecordDetailView(recordID: $0.id) }
    }

    private var modules: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeading("Operation map", eyebrow: "One connected system")
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(OpsModule.allCases) { module in
                    NavigationLink { ModuleDetailView(module: module) } label: {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Image(systemName: module.icon).foregroundStyle(OpsTheme.cyan)
                                Spacer()
                                Text("\(store.count(for: module))").font(.caption.monospacedDigit()).foregroundStyle(OpsTheme.muted)
                            }
                            Text(module.shortName).font(.subheadline.weight(.bold)).foregroundStyle(.primary)
                            Text(module.purpose).font(.caption2).foregroundStyle(.secondary).lineLimit(2)
                        }
                        .frame(maxWidth: .infinity, minHeight: 96, alignment: .topLeading)
                        .padding(14)
                        .background(OpsTheme.panel, in: RoundedRectangle(cornerRadius: 16))
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(.white.opacity(0.06)))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var activity: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeading("Decision trail", eyebrow: "Recent activity")
            VStack(alignment: .leading, spacing: 16) {
                activityRow(icon: "checkmark.circle.fill", title: "Invoice matched", detail: "PO-2026-184 · Apex Brands", time: "18m", color: OpsTheme.cyan)
                activityRow(icon: "arrow.uturn.backward.circle.fill", title: "ASIN review reopened", detail: "Fee assumption changed", time: "1h", color: OpsTheme.amber)
                activityRow(icon: "person.crop.circle.badge.checkmark", title: "Catalog assigned", detail: "Northstar June · Priya", time: "2h", color: .blue)
            }
            .padding(16)
            .background(OpsTheme.panel, in: RoundedRectangle(cornerRadius: 18))
        }
    }

    private func activityRow(icon: String, title: String, detail: String, time: String, color: Color) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon).foregroundStyle(color).frame(width: 24)
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.subheadline.weight(.semibold))
                Text(detail).font(.caption).foregroundStyle(.secondary)
            }
            Spacer()
            Text(time).font(.caption2.monospacedDigit()).foregroundStyle(OpsTheme.muted)
        }
    }
}
