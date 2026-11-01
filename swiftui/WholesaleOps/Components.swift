import SwiftUI

extension View {
    @ViewBuilder
    func platformNavigationChromeHidden() -> some View {
        #if os(iOS)
        toolbar(.hidden, for: .navigationBar)
        #else
        self
        #endif
    }

    @ViewBuilder
    func platformInlineNavigationTitle() -> some View {
        #if os(iOS)
        navigationBarTitleDisplayMode(.inline)
        #else
        self
        #endif
    }
}

struct PageBackground: View {
    var body: some View {
        LinearGradient(colors: [OpsTheme.navy, Color.black.opacity(0.94)], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct StatusPill: View {
    let status: WorkflowStatus

    var body: some View {
        Text(status.rawValue)
            .font(.caption2.weight(.semibold))
            .foregroundStyle(status.color)
            .padding(.horizontal, 9)
            .padding(.vertical, 5)
            .background(status.color.opacity(0.12), in: Capsule())
            .accessibilityLabel("Status: \(status.rawValue)")
    }
}

struct MetricCard: View {
    let label: String
    let value: String
    let detail: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Circle().fill(color).frame(width: 7, height: 7)
                Text(label.uppercased()).font(.caption2.weight(.bold)).foregroundStyle(OpsTheme.muted)
            }
            Text(value).font(.title2.weight(.bold).monospacedDigit())
            Text(detail).font(.caption).foregroundStyle(.secondary).lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(OpsTheme.panel, in: RoundedRectangle(cornerRadius: 18))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(.white.opacity(0.06)))
    }
}

struct RecordRow: View {
    let record: OpsRecord

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: record.module.icon)
                .font(.body.weight(.semibold))
                .foregroundStyle(OpsTheme.cyan)
                .frame(width: 38, height: 38)
                .background(OpsTheme.cyan.opacity(0.1), in: RoundedRectangle(cornerRadius: 11))
            VStack(alignment: .leading, spacing: 4) {
                Text(record.title).font(.subheadline.weight(.semibold)).foregroundStyle(.primary)
                Text(record.subtitle).font(.caption).foregroundStyle(.secondary).lineLimit(1)
            }
            Spacer(minLength: 6)
            VStack(alignment: .trailing, spacing: 5) {
                Text(record.value).font(.caption.weight(.semibold)).foregroundStyle(.primary)
                StatusPill(status: record.status)
            }
        }
        .padding(.vertical, 7)
        .contentShape(Rectangle())
    }
}

struct SectionHeading: View {
    let title: String
    let eyebrow: String?

    init(_ title: String, eyebrow: String? = nil) {
        self.title = title
        self.eyebrow = eyebrow
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let eyebrow { Text(eyebrow.uppercased()).font(.caption2.weight(.bold)).foregroundStyle(OpsTheme.cyan) }
            Text(title).font(.title3.weight(.bold))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
