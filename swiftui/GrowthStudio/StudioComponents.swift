import SwiftUI

struct StudioBackground: View {
    var body: some View {
        LinearGradient(colors: [StudioTheme.background, Color.black.opacity(0.96)], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }
}

struct StudioBadge: View {
    let text: String
    let color: Color
    var body: some View {
        Text(text.uppercased()).font(.caption2.weight(.bold)).tracking(0.4).foregroundStyle(color)
            .padding(.horizontal, 9).padding(.vertical, 5).background(color.opacity(0.12), in: Capsule())
    }
}

struct StudioMetric: View {
    let title: String
    let value: String
    let detail: String
    let icon: String
    let color: Color
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon).foregroundStyle(color)
                Spacer()
                Circle().fill(color).frame(width: 7, height: 7)
            }
            Text(value).font(.system(size: 30, weight: .bold, design: .rounded)).monospacedDigit()
            Text(title.uppercased()).font(.caption.weight(.bold)).foregroundStyle(.secondary)
            Text(detail).font(.caption2).foregroundStyle(StudioTheme.muted).lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading).padding(18)
        .background(StudioTheme.surface, in: RoundedRectangle(cornerRadius: 18))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(.white.opacity(0.06)))
    }
}

struct StudioHeader: View {
    let eyebrow: String
    let title: String
    let subtitle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(eyebrow.uppercased()).font(.caption.weight(.black)).tracking(1.2).foregroundStyle(StudioTheme.lime)
            Text(title).font(.system(size: 32, weight: .bold, design: .rounded))
            Text(subtitle).font(.subheadline).foregroundStyle(StudioTheme.muted)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SafetyBanner: View {
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "lock.shield.fill").foregroundStyle(StudioTheme.amber)
            Text("INTERNAL PRODUCTION ONLY").font(.caption.weight(.black)).tracking(0.7)
            Text("No posting, DMs, email, scheduling, or external contact without Mike’s approval.").font(.caption).foregroundStyle(.secondary)
            Spacer()
            StudioBadge(text: "Hard breaks active", color: StudioTheme.amber)
        }
        .padding(12).background(StudioTheme.amber.opacity(0.08), in: RoundedRectangle(cornerRadius: 12))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(StudioTheme.amber.opacity(0.22)))
    }
}

func statusColor(_ status: String) -> Color {
    let value = status.lowercased()
    if value.contains("complete") || value.contains("approved") || value == "ready" { return StudioTheme.lime }
    if value.contains("human") || value.contains("revision") { return StudioTheme.amber }
    if value.contains("block") { return StudioTheme.red }
    return StudioTheme.cyan
}
