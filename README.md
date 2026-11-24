# Starter (`mod-starter-template`)

A sovereign **Blue Lodge Guild Module** built on the official `mod-starter-template` (ALP v1 + FIFO IPC + XSS-safe Web UI).

## Architecture
- **Standalone First**: Works completely offline with a local SQLite WAL ledger stored under `.george/module_data/starter-template/app.db` (preserved across upgrades).
- **Agent-Native Tools**: `tools/schemas.json` + `tools/dispatch.sh` expose `starter_list_entries` and `starter_save_entry` under the `+starter` tool bundle.
- **Declarative ALP v1 Loop**: `workflows/sample_briefing.loop.json` runs a concurrent FIFO pre-flight stage (`fifo_parallel`) followed by a 200-turn ReAct phase with a JSON verification gate — editable live inside Blue Lodge's **Loop Studio**.
- **XSS-Safe UI**: `ui/panel.js` registers with `window.LodgeModules.register` using `ctx.el`, `ctx.agentName`, `ctx.action`, `ctx.launchTask`, and `ctx.openLoopStudio`.

## Quickstart
```bash
# Audit locally before publishing
python3 ~/blue-lodge/lib/tools/module_audit.py .

# Install into any Blue Lodge node
/app install <git_url_or_gitea/mod-starter-template>
```
