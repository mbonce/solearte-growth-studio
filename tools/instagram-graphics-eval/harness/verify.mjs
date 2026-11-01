import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import sharp from 'sharp';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const repoRoot = path.resolve(__dirname, '../../..');
const outDir = path.join(repoRoot, 'content/generated-graphics/repo-eval-2026-06-16');

const repos = ['open-carrusel', 'satori', 'html-to-image', 'reelstack', 'canva-clone'];
const briefs = ['matched-not-approved', 'approval-state-gap', 'saved-decision-context', 'handoff-ready'];

const repoLabels = {
  'open-carrusel': 'Open Carrusel',
  satori: 'Satori',
  'html-to-image': 'html-to-image',
  reelstack: 'ReelStack',
  'canva-clone': 'Canva Clone',
};

const briefLabels = {
  'matched-not-approved': 'Matched not approved',
  'approval-state-gap': 'Approval gap',
  'saved-decision-context': 'Decision context',
  'handoff-ready': 'Handoff ready',
};

const expected = [];
for (const repo of repos) {
  for (const brief of briefs) {
    expected.push(`${repo}-${brief}.png`);
  }
}

const results = [];
for (const file of expected) {
  const fullPath = path.join(outDir, file);
  if (!fs.existsSync(fullPath)) {
    results.push({ file, ok: false, reason: 'missing' });
    continue;
  }
  const meta = await sharp(fullPath).metadata();
  results.push({
    file,
    ok: meta.width === 1080 && meta.height === 1080,
    width: meta.width,
    height: meta.height,
    reason: meta.width === 1080 && meta.height === 1080 ? 'ok' : 'wrong dimensions',
  });
}

const failed = results.filter((result) => !result.ok);
if (failed.length > 0) {
  console.error(JSON.stringify(failed, null, 2));
  process.exit(1);
}

const thumb = 216;
const gap = 20;
const left = 190;
const top = 92;
const cols = briefs.length;
const rows = repos.length;
const sheetWidth = left + cols * thumb + (cols + 1) * gap;
const sheetHeight = top + rows * thumb + (rows + 1) * gap;

const composites = [];
for (let r = 0; r < repos.length; r += 1) {
  for (let c = 0; c < briefs.length; c += 1) {
    const repo = repos[r];
    const brief = briefs[c];
    const input = await sharp(path.join(outDir, `${repo}-${brief}.png`)).resize(thumb, thumb).png().toBuffer();
    composites.push({
      input,
      left: left + gap + c * (thumb + gap),
      top: top + gap + r * (thumb + gap),
    });
  }
}

const labelSvg = `
<svg width="${sheetWidth}" height="${sheetHeight}" xmlns="http://www.w3.org/2000/svg">
  <rect width="100%" height="100%" fill="#07080b"/>
  <text x="28" y="42" fill="#f7f3ea" font-family="Arial, sans-serif" font-size="28" font-weight="900">Instagram graphics repo comparison</text>
  <text x="28" y="70" fill="#aeb7c7" font-family="Arial, sans-serif" font-size="18" font-weight="700">20 generated 1080x1080 PNGs. Fake rows only. Internal review.</text>
  ${briefs
    .map((brief, index) => {
      const x = left + gap + index * (thumb + gap) + 4;
      return `<text x="${x}" y="86" fill="#d7ff3f" font-family="Arial, sans-serif" font-size="17" font-weight="900">${briefLabels[brief]}</text>`;
    })
    .join('')}
  ${repos
    .map((repo, index) => {
      const y = top + gap + index * (thumb + gap) + 112;
      return `<text x="28" y="${y}" fill="#f7f3ea" font-family="Arial, sans-serif" font-size="22" font-weight="900">${repoLabels[repo]}</text>`;
    })
    .join('')}
</svg>`;

await sharp(Buffer.from(labelSvg)).composite(composites).png().toFile(path.join(outDir, 'contact-sheet.png'));

const manifest = {
  generatedAt: new Date().toISOString(),
  outputDir: outDir,
  count: results.length,
  dimensions: '1080x1080',
  files: results,
  contactSheet: path.join(outDir, 'contact-sheet.png'),
};

fs.writeFileSync(path.join(outDir, 'manifest.json'), `${JSON.stringify(manifest, null, 2)}\n`);
console.log(`Verified ${results.length} PNG files and wrote contact-sheet.png`);
