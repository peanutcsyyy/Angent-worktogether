# Hermes Claude Visible Orchestrator

Visible multi-agent workflow for Windows + WSL where Hermes coordinates and Claude Code does the hands-on coding in a real terminal window.

## Features

- visible Claude Code terminal sessions
- Hermes-as-orchestrator workflow
- WSL + tmux session model
- reusable Windows bridge scripts
- privacy-safe local configuration pattern
- example Hermes trigger hook

## Repository Layout

- `README.md`: project overview
- `LICENSE`: MIT license
- `实时检测Angent工作流.md`: Chinese overview
- `config/agent-workflow.example.json`: config template
- `docs/SETUP.md`: installation and setup
- `docs/USAGE.md`: usage and privacy guidance
- `docs/TROUBLESHOOTING.md`: common failure modes
- `docs/HERMES_INTEGRATION.md`: how to wire this into Hermes
- `skills/hermes-claude-visible-orchestrator/SKILL.md`: Hermes skill definition
- `scripts/windows/`: Windows bridge scripts
- `scripts/wsl/`: WSL bridge script
- `examples/hermes_claude_monitor_hook.py`: portable trigger example

## Quick Start

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\windows\install.ps1
```

Then:

1. review `config/agent-workflow.local.json`
2. start `scripts/windows/claude_bridge_helper.ps1`
3. create a Claude tmux session in WSL
4. launch Claude in that session
5. emit a trigger file or call `claude_tmux_monitor.ps1`

## Docs

- [Setup](/C:/Users/c/Documents/New%20project/docs/SETUP.md)
- [Usage](/C:/Users/c/Documents/New%20project/docs/USAGE.md)
- [Troubleshooting](/C:/Users/c/Documents/New%20project/docs/TROUBLESHOOTING.md)
- [Hermes Integration](/C:/Users/c/Documents/New%20project/docs/HERMES_INTEGRATION.md)

## Privacy

This repo is structured so people can publish the workflow without publishing their own machine details.

- machine-specific settings belong in `config/agent-workflow.local.json`
- `config/*.local.json` is ignored by Git
- local startup helpers, logs, databases, and tokens should stay out of version control

## Status

This is now a reusable open-source starter for the workflow, not just a local note dump. Most users will still need to adapt the Hermes-side trigger integration for their own environment.
