// Builds ready-to-paste posts from data/content-queue.json into dist/posts/ and a calendar.
import { readFile, mkdir, writeFile } from "node:fs/promises";
import { brand } from "./lib.mjs";
const queue = JSON.parse(await readFile(new URL("../data/content-queue.json", import.meta.url), "utf8"));
const sneakers = brand.products.find(p => /Sneakers/.test(p.name));
const fill = s => s.replaceAll("{{rmian}}", brand.rmianLine).replaceAll("{{email}}", brand.email).replaceAll("{{sneakersPrice}}", sneakers.price.toFixed(2));
await mkdir("dist/posts", { recursive: true });
const rows = [];
for (const p of queue) {
  const caption = fill(p.caption);
  const txt = `# Day ${p.day} — ${p.format} — ${p.pillar}\nHOOK: ${p.hook}\n\nCAPTION:\n${caption}\n\nALT TEXT:\n${p.alt}\n\nNEEDS FROM ARTIST:\n${p.needs.length ? p.needs.map(n => "- " + n).join("\n") : "- nothing (assets exist)"}\n\nAPPROVED BY ARTIST: [ ]\n`;
  await writeFile(`dist/posts/day-${p.day}-${p.format}.txt`, txt);
  rows.push(`| ${p.day} | ${p.format} | ${p.pillar} | ${p.hook} | ${p.needs.length ? "needs assets" : "ready"} |`);
}
await writeFile("dist/calendar.md", `# Week 1 Calendar\n\n| Day | Format | Pillar | Hook | Status |\n|---|---|---|---|---|\n${rows.join("\n")}\n`);
console.log(`built ${queue.length} posts -> dist/posts/, dist/calendar.md`);
