import { readFile } from "node:fs/promises";
export const brand = JSON.parse(await readFile(new URL("../data/brand.json", import.meta.url), "utf8"));
export async function fetchText(url) {
  const r = await fetch(url, { headers: { "user-agent": "Mozilla/5.0 solearte-growth-studio" }, redirect: "follow" });
  if (!r.ok) throw new Error(`${url} -> ${r.status}`);
  return r.text();
}
export const strip = (html) => html.replace(/<(script|style|noscript|svg)[^>]*>[\s\S]*?<\/\1>/gi, "").replace(/<[^>]+>/g, " ").replace(/&amp;/g, "&").replace(/&#39;|&rsquo;/g, "'").replace(/\s+/g, " ").trim();
