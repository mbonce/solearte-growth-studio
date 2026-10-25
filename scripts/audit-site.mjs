// Live audit of solearte.co against known growth blockers. Exit 1 if any FAIL.
import { brand, fetchText, strip } from "./lib.mjs";
const base = brand.site;
const results = [];
const check = (name, ok, detail) => results.push({ name, ok, detail });
try {
  const home = await fetchText(base);
  const homeText = strip(home);
  check("Homepage reachable", true, base);
  check("Title has 'Denver Portrait Artist'", /Denver Portrait Artist/i.test(home), (home.match(/<title>([^<]*)/) || [])[1]);
  check("Instagram linked from site", /instagram\.com/i.test(home), "showSocial appears off");
  check("Header button visible", !/"showButton"\s*:\s*false/.test(home.replace(/&quot;/g, '"')), 'header "Book" button is hidden');
  const shop = await fetchText(base + brand.pages.shop);
  const shopText = strip(shop);
  check("Carry Your Colors page reachable", true, brand.pages.shop);
  check("RMIAN 15% line present", /15%\s+of\s+proceeds/i.test(shopText), "");
  for (const p of brand.products) {
    const m = shopText.match(new RegExp(p.name.replace(/[.*+?^${}()|[\]\\]/g, "\\$&") + "\\s*\\$([0-9.,]+)", "i"));
    const price = m ? parseFloat(m[1].replace(/,/g, "")) : null;
    check(`${p.name} priced`, price !== null && price > 0, price === null ? "not found" : `$${price}`);
    if (p.price && price && Math.abs(price - p.price) > 0.01) check(`${p.name} matches data/brand.json`, false, `site $${price} vs repo $${p.price}`);
  }
  check("Sneaker sizing guidance on shop", /size (guide|chart)|true to size|runs (small|large)/i.test(shopText), "no sizing text found");
  const com = await fetchText(base + brand.pages.commission);
  const comText = strip(com);
  check("Commission page reachable", true, brand.pages.commission);
  check("Commission page has a form", /<form/i.test(com) && /type="(email|file)"|textarea/i.test(com), "email-only inquiry path");
  check("Commission page mentions email", comText.includes("@gmail.com"), "");
  check("No commission price published", !/\$\s?\d{2,}/.test(comText), "a price appears on the commission page");
} catch (e) { check("Fetch", false, String(e.message)); }
let fails = 0;
for (const r of results) { if (!r.ok) fails++; console.log(`${r.ok ? "PASS" : "FAIL"}  ${r.name}${r.detail ? "  — " + r.detail : ""}`); }
console.log(`\n${results.length - fails} pass, ${fails} fail`);
process.exit(fails ? 1 : 0);
