import fs from "node:fs";

const statePath = "agent-ops/loop-state.json";
const policyPath = "agent-ops/hard-break-policy.yml";

const requiredForbiddenActions = [
  "post",
  "dm_send",
  "email_send",
  "external_schedule",
  "pricing_promise",
  "account_health_advice",
  "legal_or_compliance_advice",
  "public_result_claim",
  "undocumented_product_claim"
];

function fail(message) {
  console.error(`loop-state check failed: ${message}`);
  process.exitCode = 1;
}

function readJson(path) {
  try {
    return JSON.parse(fs.readFileSync(path, "utf8"));
  } catch (error) {
    fail(`could not read valid JSON at ${path}: ${error.message}`);
    return null;
  }
}

const state = readJson(statePath);
const policy = fs.existsSync(policyPath) ? fs.readFileSync(policyPath, "utf8") : "";

if (!state) {
  process.exit();
}

if (state.loop_mode === "active_internal_only") {
  if (state.minimum_active_agents < 2) {
    fail("minimum_active_agents must be at least 2");
  }

  const activeAgents = Array.isArray(state.active_agents)
    ? state.active_agents.filter((agent) => agent.status === "active")
    : [];

  if (activeAgents.length < 2) {
    fail("active_internal_only mode requires at least two active agents");
  }

  for (const agent of activeAgents) {
    const forbidden = new Set(agent.forbidden_actions || []);
    for (const action of ["post", "dm_send", "email_send", "external_schedule", "external_contact"]) {
      if (!forbidden.has(action)) {
        fail(`${agent.agent || agent.task_id} is missing forbidden action ${action}`);
      }
    }
  }
}

const stateForbidden = new Set(state.forbidden_actions || []);
for (const action of requiredForbiddenActions) {
  if (!stateForbidden.has(action)) {
    fail(`loop-state.json missing required forbidden action ${action}`);
  }
  if (!policy.includes(action)) {
    fail(`hard-break-policy.yml missing required forbidden action ${action}`);
  }
}

if (!policy.includes("minimum_active_agents: 2")) {
  fail("hard-break-policy.yml must preserve minimum_active_agents: 2");
}

if (!process.exitCode) {
  console.log("loop-state check passed");
}
