// Guardrail: scan repo text for banned words, wrong RMIAN %, or published commission prices.
import { readdir, readFile } from "node:fs/promises";
import { join } from "node:path";
import { brand } from "./lib.mjs";
const roots = ["content", "instagram", "website", "sales", "outbound", "lead-magnets", "swipe-files", "site", "data"];
const skipDirs = new Set(["node_modules", ".git", "dist", ".agents"]);
async function* walk(d) { for (const e of await readdir(d, { withFileTypes: true }).catch(() => [])) { if (skipDirs.has(e.name)) continue; const p = join(d, e.name); if (e.isDirectory()) yield* walk(p); else if (/\.(md|html|json|txt)$/.test(e.name)) yield p; } }
const issues = [];
for (const root of roots) for await (const f of walk(root)) {
  const t = await readFile(f, "utf8");
  for (const w of brand.bannedWords) { const re = new RegExp(`\\b${w}\\b`, "i"); if (re.test(t) && !/banned|do not fit|avoid|never/i.test(t.split("\n").find(l => re.test(l)) || "")) issues.push(`${f}: banned word "${w}"`); }
  const pct = [...t.matchAll(/(\d+)%\s+of\s+(?:proceeds|every)/gi)].map(m => +m[1]).filter(n => n !== brand.rmianPercent);
  if (pct.length) issues.push(`${f}: RMIAN percent stated as ${pct.join(",")}% (must be ${brand.rmianPercent}%)`);
  if (/commission[^.\n]{0,80}\$\s?\d{2,}/i.test(t) && !/never|do not|no price/i.test(t)) issues.push(`${f}: possible published commission price`);
}
if (issues.length) { console.error(issues.join("\n")); console.error(`\n${issues.length} claim issue(s)`); process.exit(1); }
console.log("claims OK: no banned words, RMIAN % correct, no commission prices");
