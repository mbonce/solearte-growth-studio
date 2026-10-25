import fs from "node:fs";
import path from "node:path";

const manifestPath = "agent-ops/downloads-export-manifest.json";
const dryRun = process.argv.includes("--dry-run");

function fail(message) {
  console.error(`downloads export failed: ${message}`);
  process.exit(1);
}

const manifest = JSON.parse(fs.readFileSync(manifestPath, "utf8"));
const exportRoot = manifest.export_root;

for (const entry of manifest.exports) {
  if (entry.export_status !== "pending_filesystem_export") {
    continue;
  }

  if (!fs.existsSync(entry.source_path)) {
    fail(`missing source ${entry.source_path}`);
  }

  const targetPath = entry.target_path;
  if (!targetPath.startsWith(`${exportRoot}/`)) {
    fail(`target outside export root: ${targetPath}`);
  }

  console.log(`${dryRun ? "would export" : "exporting"} ${entry.source_path} -> ${targetPath}`);

  if (!dryRun) {
    fs.mkdirSync(path.dirname(targetPath), { recursive: true });
    fs.copyFileSync(entry.source_path, targetPath);
    entry.export_status = "exported";
    entry.exported_at = new Date().toISOString();
  }
}

if (!dryRun) {
  manifest.updated_at = new Date().toISOString();
  fs.writeFileSync(manifestPath, `${JSON.stringify(manifest, null, 2)}\n`);
}
