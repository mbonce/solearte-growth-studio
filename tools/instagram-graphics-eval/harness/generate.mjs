import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { execFile } from 'child_process';
import { promisify } from 'util';
import satori from 'satori';
import { Resvg } from '@resvg/resvg-js';
import { chromium } from 'playwright';

const execFileAsync = promisify(execFile);
const __dirname = path.dirname(fileURLToPath(import.meta.url));
const evalRoot = path.resolve(__dirname, '..');
const repoRoot = path.resolve(__dirname, '../../..');
const reposDir = path.join(evalRoot, 'repos');
const outDir = path.join(repoRoot, 'content/generated-graphics/repo-eval-2026-06-16');

const W = 1080;
const H = 1080;

const briefs = [
  {
    key: 'matched-not-approved',
    short: 'Matched product',
    kicker: 'AMAZON CATALOG TRAP',
    title: 'A matched product is not an Amazon buy',
    sub: 'Your team still needs a decision, an owner, and the next move before it hits the buy list.',
    amazon: 'Amazon supplier catalog',
    cards: ['Product found', 'Review not finished', 'Buy list still blocked'],
    accent: '#ff5a1f',
    alt: '#f6ff45',
  },
  {
    key: 'approval-state-gap',
    short: 'Approval gap',
    kicker: 'SELLER WORKFLOW GAP',
    title: 'Who is deciding this Amazon row?',
    sub: 'If the owner, reason, or next action is missing, the catalog row is still stuck.',
    amazon: 'Amazon marketplace review',
    cards: ['Owner missing', 'Reason missing', 'Next action missing'],
    accent: '#00d4ff',
    alt: '#ff8a00',
  },
  {
    key: 'saved-decision-context',
    short: 'Decision context',
    kicker: 'DON’T LOSE THE CALL',
    title: 'Keep the Amazon buying decision attached',
    sub: 'The next operator should see why the product moved forward or got rejected.',
    amazon: 'Amazon buy list prep',
    cards: ['Decision note saved', 'Reviewer visible', 'Reusable next step'],
    accent: '#8b5cff',
    alt: '#d7ff3f',
  },
  {
    key: 'handoff-ready',
    short: 'Handoff ready',
    kicker: 'READY FOR OPS',
    title: 'Amazon handoff needs more than “looks good”',
    sub: 'The row is ready only when the note, owner, and action can travel together.',
    amazon: 'Amazon operations handoff',
    cards: ['Decision saved', 'Owner assigned', 'Action is clear'],
    accent: '#20f07a',
    alt: '#ff3d2e',
  },
];

const repoLabels = {
  'open-carrusel': 'Open Carrusel',
  satori: 'Satori',
  'html-to-image': 'html-to-image',
  reelstack: 'ReelStack',
  'canva-clone': 'Canva Clone',
};

fs.mkdirSync(outDir, { recursive: true });

function escapeHtml(value) {
  return String(value)
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;');
}

function openCarruselHtml(brief, index) {
  const tilt = [-5, 4, -3, 5][index];
  return `<!doctype html>
  <html><head><meta charset="utf-8" />
  <style>
    * { box-sizing: border-box; }
    html, body { margin: 0; width: ${W}px; height: ${H}px; overflow: hidden; }
    body { background: #08080b; color: #f8f4e8; font-family: Arial, sans-serif; }
    .stage {
      position: relative; width: ${W}px; height: ${H}px; padding: 58px;
      background:
        radial-gradient(circle at 75% 10%, ${brief.accent}66, transparent 24%),
        linear-gradient(145deg, #09090d 0%, #111827 55%, #030406 100%);
      overflow: hidden;
    }
    .tape { position: absolute; inset: 38px; border: 2px solid rgba(248,244,232,.16); transform: rotate(-1deg); }
    .giant { position:absolute; right:-90px; top:25px; width:260px; height:1180px; background:${brief.accent}; transform:rotate(12deg); }
    .badge { position: relative; display:inline-block; padding:12px 18px; color:#050608; background:${brief.alt}; font-weight:900; font-size:25px; text-transform:uppercase; }
    .amazon { position:absolute; top:58px; right:58px; z-index:3; color:#050608; background:#f8f4e8; padding:12px 16px; font-weight:900; font-size:22px; transform:rotate(${tilt}deg); }
    h1 { position:relative; z-index:2; width:760px; margin:44px 0 0; font-family:Impact,"Arial Black",sans-serif; font-size:${index === 1 ? 105 : 96}px; line-height:.89; text-transform:uppercase; letter-spacing:0; }
    .sub { position:relative; z-index:2; width:620px; margin-top:26px; color:#cdd5df; font-size:31px; line-height:1.12; font-weight:800; }
    .deck { position:absolute; z-index:4; left:72px; bottom:106px; width:770px; display:grid; gap:16px; }
    .card { min-height:82px; display:grid; grid-template-columns:72px 1fr; align-items:center; padding:0 24px; background:#f8f4e8; color:#08080b; box-shadow:18px 18px 0 #000; border-left:16px solid ${brief.accent}; }
    .card:nth-child(2) { margin-left:70px; transform:rotate(-1.5deg); }
    .card:nth-child(3) { margin-left:24px; transform:rotate(1.2deg); }
    .num { color:${brief.accent}; font-family:Monaco,monospace; font-size:25px; font-weight:900; }
    .txt { font-size:30px; font-weight:900; text-transform:uppercase; }
    .footer { position:absolute; left:58px; right:58px; bottom:42px; display:flex; justify-content:space-between; color:#aeb7c7; font-weight:900; font-size:20px; text-transform:uppercase; }
    .footer b { color:#f8f4e8; }
  </style></head>
  <body><main class="stage">
    <div class="giant"></div><div class="tape"></div>
    <div class="amazon">${escapeHtml(brief.amazon)}</div>
    <div class="badge">${escapeHtml(brief.kicker)}</div>
    <h1>${escapeHtml(brief.title)}</h1>
    <div class="sub">${escapeHtml(brief.sub)}</div>
    <section class="deck">${brief.cards.map((card, i) => `<div class="card"><div class="num">0${i + 1}</div><div class="txt">${escapeHtml(card)}</div></div>`).join('')}</section>
    <footer class="footer"><b>Open Carrusel style</b><span>Internal review only</span></footer>
  </main></body></html>`;
}

function htmlToImageHtml(brief, index) {
  return `<!doctype html>
  <html><head><meta charset="utf-8" />
  <style>
    * { box-sizing: border-box; }
    html, body { margin: 0; width: ${W}px; height: ${H}px; overflow: hidden; }
    body { font-family: Arial, sans-serif; background:#e8dfcf; }
    .frame {
      position:relative; width:${W}px; height:${H}px; overflow:hidden; padding:54px;
      background:
        linear-gradient(90deg, rgba(0,0,0,.06) 1px, transparent 1px),
        linear-gradient(0deg, rgba(0,0,0,.06) 1px, transparent 1px),
        #eadfce;
      background-size:42px 42px;
    }
    .phone { position:absolute; right:60px; top:88px; width:360px; height:760px; background:#10131a; border:14px solid #050608; border-radius:46px; box-shadow:28px 30px 0 rgba(0,0,0,.22); padding:28px; }
    .phoneTop { height:36px; border-radius:20px; background:#202836; margin:0 auto 24px; width:130px; }
    .screenTag { color:#050608; background:${brief.alt}; display:inline-block; padding:10px 12px; font-weight:900; font-size:19px; text-transform:uppercase; }
    .screenRow { margin-top:18px; padding:15px; border:2px solid rgba(255,255,255,.14); color:#f8f4e8; font-weight:900; font-size:21px; text-transform:uppercase; }
    .screenRow.hot { border-color:${brief.accent}; color:${brief.accent}; }
    .paper { position:absolute; left:58px; top:80px; width:630px; min-height:660px; padding:42px; background:#fff8e7; color:#08080b; box-shadow:20px 20px 0 #16110c; transform:rotate(${index % 2 === 0 ? '-2.2deg' : '2deg'}); }
    .paper:before { content:"AMAZON SELLER NOTE"; position:absolute; top:-22px; left:44px; background:${brief.accent}; color:#050608; font-weight:900; padding:10px 16px; font-size:22px; transform:rotate(${index % 2 === 0 ? '2deg' : '-2deg'}); }
    h1 { margin:34px 0 22px; font-family:Impact,"Arial Black",sans-serif; font-size:${index === 2 ? 82 : 88}px; line-height:.88; text-transform:uppercase; letter-spacing:0; }
    .sub { font-size:31px; line-height:1.16; font-weight:900; color:#20242d; width:500px; }
    .sticky { position:absolute; left:${index % 2 === 0 ? 420 : 370}px; bottom:112px; width:260px; min-height:170px; padding:22px; background:${brief.accent}; color:#050608; font-weight:900; font-size:29px; line-height:1; transform:rotate(${index % 2 === 0 ? '7deg' : '-7deg'}); box-shadow:12px 12px 0 rgba(0,0,0,.28); }
    .stamp { position:absolute; left:64px; bottom:56px; color:#050608; border:4px solid #050608; padding:12px 18px; font-size:24px; font-weight:900; text-transform:uppercase; transform:rotate(-3deg); }
  </style></head>
  <body><main class="frame">
    <article class="paper"><div class="screenTag">${escapeHtml(brief.kicker)}</div><h1>${escapeHtml(brief.title)}</h1><div class="sub">${escapeHtml(brief.sub)}</div></article>
    <section class="phone"><div class="phoneTop"></div><div class="screenTag">Amazon workflow</div>${brief.cards.map((card, i) => `<div class="screenRow ${i === 1 ? 'hot' : ''}">${escapeHtml(card)}</div>`).join('')}</section>
    <div class="sticky">${escapeHtml(brief.short)}<br>needs a visible call</div>
    <div class="stamp">html-to-image capture</div>
  </main></body></html>`;
}

const h = (type, props, ...children) => {
  const nextProps = { ...(props || {}) };
  if (type === 'div') nextProps.style = { display: 'flex', ...(nextProps.style || {}) };
  return { type, props: { ...nextProps, children: children.length === 1 ? children[0] : children } };
};

async function writeOpenCarrusel() {
  const browser = await chromium.launch();
  try {
    const page = await browser.newPage({ viewport: { width: W, height: H, deviceScaleFactor: 1 } });
    for (const [index, brief] of briefs.entries()) {
      await page.setContent(openCarruselHtml(brief, index), { waitUntil: 'networkidle' });
      await page.screenshot({ path: path.join(outDir, `open-carrusel-${brief.key}.png`), type: 'png' });
    }
  } finally {
    await browser.close();
  }
}

async function writeSatori() {
  const arial = fs.readFileSync('/System/Library/Fonts/Supplemental/Arial.ttf');
  const arialBold = fs.readFileSync('/System/Library/Fonts/Supplemental/Arial Bold.ttf');
  const impact = fs.readFileSync('/System/Library/Fonts/Supplemental/Impact.ttf');

  for (const [index, brief] of briefs.entries()) {
    const cream = index % 2 === 0 ? '#f3ead9' : '#10131a';
    const ink = index % 2 === 0 ? '#10131a' : '#f3ead9';
    const element = h(
      'div',
      { style: { width: '1080px', height: '1080px', backgroundColor: cream, color: ink, padding: '62px', flexDirection: 'column', fontFamily: 'Arial', position: 'relative' } },
      h('div', { style: { position: 'absolute', right: '-70px', top: '70px', width: '430px', height: '430px', borderRadius: '999px', backgroundColor: brief.accent, opacity: 0.92 } }),
      h('div', { style: { width: '100%', justifyContent: 'space-between', alignItems: 'center' } },
        h('div', { style: { backgroundColor: brief.accent, color: '#08080b', padding: '12px 18px', fontSize: '24px', fontWeight: 900 } }, brief.kicker),
        h('div', { style: { border: `3px solid ${ink}`, padding: '10px 14px', fontSize: '22px', fontWeight: 900 } }, 'AMAZON SELLER OPS')
      ),
      h('div', { style: { marginTop: '58px', width: '780px', fontFamily: 'Impact', fontSize: index === 2 ? '91px' : '96px', lineHeight: 0.9, textTransform: 'uppercase' } }, brief.title),
      h('div', { style: { marginTop: '26px', width: '670px', fontSize: '32px', lineHeight: 1.15, fontWeight: 800 } }, brief.sub),
      h('div', { style: { position: 'absolute', left: '62px', bottom: '116px', width: '650px', flexDirection: 'column', gap: '14px' } },
        ...brief.cards.map((card, i) => h('div', { style: { minHeight: '76px', alignItems: 'center', backgroundColor: i === 1 ? brief.accent : ink, color: i === 1 ? '#08080b' : cream, padding: '0 22px', justifyContent: 'space-between' } },
          h('div', { style: { fontSize: '25px', fontWeight: 900 } }, `0${i + 1}`),
          h('div', { style: { fontSize: '29px', fontWeight: 900, textTransform: 'uppercase' } }, card)
        ))
      ),
      h('div', { style: { position: 'absolute', left: '62px', bottom: '48px', fontSize: '22px', fontWeight: 900, color: ink } }, 'Satori vector render  Internal review only')
    );

    const svg = await satori(element, {
      width: W,
      height: H,
      fonts: [
        { name: 'Arial', data: arial, weight: 400, style: 'normal' },
        { name: 'Arial', data: arialBold, weight: 900, style: 'normal' },
        { name: 'Impact', data: impact, weight: 900, style: 'normal' },
      ],
    });
    fs.writeFileSync(path.join(outDir, `satori-${brief.key}.png`), new Resvg(svg).render().asPng());
  }
}

async function writeHtmlToImage() {
  const htmlToImageDist = path.join(__dirname, 'node_modules/html-to-image/dist/html-to-image.js');
  const browser = await chromium.launch();
  try {
    const page = await browser.newPage({ viewport: { width: W, height: H, deviceScaleFactor: 1 } });
    for (const [index, brief] of briefs.entries()) {
      await page.setContent(htmlToImageHtml(brief, index), { waitUntil: 'load' });
      await page.addScriptTag({ path: htmlToImageDist });
      const dataUrl = await page.evaluate(async () => window.htmlToImage.toPng(document.querySelector('.frame'), { pixelRatio: 1, cacheBust: true }));
      fs.writeFileSync(path.join(outDir, `html-to-image-${brief.key}.png`), Buffer.from(dataUrl.replace(/^data:image\/png;base64,/, ''), 'base64'));
    }
  } finally {
    await browser.close();
  }
}

async function writeCanvaClone() {
  const fabricPath = path.join(reposDir, 'canva-clone/node_modules/fabric/dist/fabric.min.js');
  const fabricCode = fs.readFileSync(fabricPath, 'utf-8');
  const browser = await chromium.launch();
  try {
    for (const [index, brief] of briefs.entries()) {
      const page = await browser.newPage({ viewport: { width: W, height: H, deviceScaleFactor: 1 } });
      const html = `<!doctype html><html><head><meta charset="utf-8" /><style>html,body{margin:0;width:${W}px;height:${H}px;overflow:hidden;background:#d6bc8b}canvas{display:block}</style></head><body><canvas id="c" width="${W}" height="${H}"></canvas><script>${fabricCode}</script><script>(() => {
        const canvas = new fabric.StaticCanvas('c', { backgroundColor: '#d6bc8b' });
        const accent = '${brief.accent}';
        canvas.add(new fabric.Rect({ left: 0, top: 0, width: 1080, height: 1080, fill: '#d6bc8b' }));
        for (let x = -40; x < 1120; x += 86) {
          canvas.add(new fabric.Line([x, 0, x - 220, 1080], { stroke: 'rgba(61,43,20,.13)', strokeWidth: 2 }));
        }
        canvas.add(new fabric.Rect({ left: 54, top: 54, width: 972, height: 972, fill: '#f3dfb6', stroke: '#251a0e', strokeWidth: 5 }));
        canvas.add(new fabric.Rect({ left: 72, top: 72, width: 936, height: 936, fill: 'transparent', stroke: 'rgba(37,26,14,.3)', strokeWidth: 2, strokeDashArray: [18, 10] }));
        canvas.add(new fabric.Rect({ left: 650, top: 104, width: 270, height: 88, fill: '#fff8e8', stroke: '#251a0e', strokeWidth: 4, angle: ${index % 2 === 0 ? 4 : -4} }));
        canvas.add(new fabric.Textbox('AMAZON SELLER WORKFLOW', { left: 675, top: 130, width: 230, fontFamily: 'Arial', fontSize: 23, fontWeight: 900, fill: '#251a0e', angle: ${index % 2 === 0 ? 4 : -4} }));
        canvas.add(new fabric.Textbox(${JSON.stringify(brief.kicker)}, { left: 94, top: 98, width: 460, fontFamily: 'Arial', fontSize: 24, fontWeight: 900, fill: '#251a0e', backgroundColor: '${brief.alt}' }));
        canvas.add(new fabric.Textbox(${JSON.stringify(brief.title.toUpperCase())}, { left: 94, top: 174, width: 610, fontFamily: 'Impact', fontSize: ${index === 2 ? 78 : 84}, lineHeight: .86, fill: '#251a0e' }));
        canvas.add(new fabric.Rect({ left: 92, top: 454, width: 660, height: 138, fill: '#fff8e8', stroke: '#251a0e', strokeWidth: 4 }));
        canvas.add(new fabric.Textbox(${JSON.stringify(brief.sub)}, { left: 116, top: 478, width: 610, fontFamily: 'Arial', fontSize: 29, fontWeight: 900, lineHeight: 1.08, fill: '#251a0e' }));
        canvas.add(new fabric.Rect({ left: 790, top: 390, width: 150, height: 150, fill: accent, stroke: '#251a0e', strokeWidth: 4, angle: 12 }));
        canvas.add(new fabric.Textbox('BUY LIST?', { left: 807, top: 443, width: 120, fontFamily: 'Arial', fontSize: 26, fontWeight: 900, fill: '#08080b', textAlign: 'center', angle: 12 }));
        ${brief.cards.map((card, i) => `
          canvas.add(new fabric.Rect({ left: ${112 + i * 42}, top: ${675 + i * 86}, width: 720, height: 68, fill: '${i === 1 ? brief.alt : '#fff8e8'}', stroke: '#251a0e', strokeWidth: 4, angle: ${i === 1 ? -2.5 : i === 2 ? 1.8 : 0} }));
          canvas.add(new fabric.Textbox('STEP ${i + 1}', { left: ${134 + i * 42}, top: ${695 + i * 86}, width: 95, fontFamily: 'Arial', fontSize: 20, fontWeight: 900, fill: '#251a0e', angle: ${i === 1 ? -2.5 : i === 2 ? 1.8 : 0} }));
          canvas.add(new fabric.Textbox(${JSON.stringify(card.toUpperCase())}, { left: ${248 + i * 42}, top: ${694 + i * 86}, width: 480, fontFamily: 'Arial', fontSize: 25, fontWeight: 900, fill: '#251a0e', angle: ${i === 1 ? -2.5 : i === 2 ? 1.8 : 0} }));
        `).join('')}
        canvas.add(new fabric.Textbox('CANVA CLONE FABRIC CANVAS', { left: 94, top: 964, width: 430, fontFamily: 'Arial', fontSize: 22, fontWeight: 900, fill: '#251a0e' }));
        canvas.add(new fabric.Textbox('INTERNAL REVIEW ONLY', { left: 688, top: 964, width: 300, fontFamily: 'Arial', fontSize: 22, fontWeight: 900, fill: '#251a0e', textAlign: 'right' }));
        canvas.renderAll();
        window.__fabricCanvas = canvas;
        setTimeout(() => { window.__fabricDone = true; }, 150);
      })();</script></body></html>`;
      await page.setContent(html, { waitUntil: 'load' });
      await page.waitForFunction(() => window.__fabricDone === true, { timeout: 5000 });
      const dataUrl = await page.evaluate(() => window.__fabricCanvas.toDataURL({ format: 'png', multiplier: 1 }));
      fs.writeFileSync(path.join(outDir, `canva-clone-${brief.key}.png`), Buffer.from(dataUrl.replace(/^data:image\/png;base64,/, ''), 'base64'));
      await page.close();
    }
  } finally {
    await browser.close();
  }
}

async function writeReelStack() {
  await execFileAsync('bun', ['generate-reelstack.ts'], { cwd: __dirname, env: { ...process.env }, maxBuffer: 1024 * 1024 * 20 });
}

async function main() {
  await writeOpenCarrusel();
  await writeSatori();
  await writeHtmlToImage();
  await writeCanvaClone();
  await writeReelStack();
  const files = fs.readdirSync(outDir).filter((file) => file.endsWith('.png') && !file.includes('contact-sheet')).sort();
  console.log(`Generated ${files.length} PNG files in ${outDir}`);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
