import path from 'path';
import { fileURLToPath } from 'url';
import { renderToFile } from '../repos/reelstack/packages/image-gen/src/index.ts';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const repoRoot = path.resolve(__dirname, '../../..');
const outDir = path.join(repoRoot, 'content/generated-graphics/repo-eval-2026-06-16');
const brandsDir = path.join(__dirname, 'brands');

const items = [
  {
    key: 'matched-not-approved',
    template: 'product-cover',
    params: {
      badge: 'AMAZON CATALOG TRAP',
      subtitle: 'A matched product is not an Amazon buy. The buy list still needs a visible decision.',
    },
  },
  {
    key: 'approval-state-gap',
    template: 'tip-card',
    params: {
      badge: 'SELLER WORKFLOW',
      title: 'Before an Amazon row moves forward',
      bullets: 'Name the decision owner|Save the reason|Write the next action',
      num: '002',
    },
  },
  {
    key: 'saved-decision-context',
    template: 'myth',
    params: {
      number: '003',
      myth: 'The team will remember why the Amazon product was rejected.',
      reality: 'The decision has to stay attached to the row.',
    },
  },
  {
    key: 'handoff-ready',
    template: 'point',
    params: {
      number: '004',
      badge: 'READY FOR OPS',
      title: 'Amazon handoff needs owner plus action',
      text: 'A row is not ready until the next operator can see the note, owner, and next move.',
      titleHighlight: 'owner plus action',
      color: '#20f07a',
    },
  },
];

for (const item of items) {
  const outputPath = path.join(outDir, `reelstack-${item.key}.png`);
  await renderToFile(
    {
      brand: 'wholesale-ops',
      template: item.template,
      size: 'post',
      ...item.params,
    },
    outputPath,
    brandsDir
  );
  console.log(outputPath);
}
