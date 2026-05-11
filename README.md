# Hermes Claude Visible Orchestrator

This repository packages a visible multi-agent workflow where Hermes acts as the orchestrator and Claude Code acts as the execution agent in a real terminal window.

## What It Does

- lets Hermes plan and delegate coding tasks
- launches Claude Code in a visible terminal session
- lets users watch Claude work live
- keeps Hermes responsible for monitoring and summarizing progress
- exposes reusable Windows and WSL bridge scripts

## Repository Layout

- `README.md`: project overview
- `实时检测Angent工作流.md`: public-facing Chinese workflow overview
- `config/agent-workflow.example.json`: public config template
- `docs/SETUP.md`: setup instructions
- `docs/USAGE.md`: usage and privacy-safe local configuration
- `skills/hermes-claude-visible-orchestrator/SKILL.md`: Hermes skill definition
- `scripts/windows/`: Windows-side bridge scripts
- `scripts/wsl/`: WSL-side tmux attach script
- `examples/hermes_claude_monitor_hook.py`: portable trigger-emitter example

## Included Code

### Windows bridge

- `scripts/windows/install.ps1`
- `scripts/windows/claude_bridge_helper.ps1`
- `scripts/windows/claude_tmux_monitor.ps1`
- `scripts/windows/claude_tmux_attach.cmd`
- `scripts/windows/claude_tmux_attach.vbs`
- `scripts/windows/install_startup_helper.ps1`
- `scripts/windows/load_workflow_config.ps1`

### WSL bridge

- `scripts/wsl/attach_tmux.sh`

### Hermes integration example

- `examples/hermes_claude_monitor_hook.py`

This example shows how an orchestration layer can detect Claude-related tmux commands and emit a trigger file for the desktop helper.

## Target Environment

- Windows
- WSL
- tmux
- Hermes or another orchestration layer
- Claude Code CLI

## Quick Start

1. Run `powershell -ExecutionPolicy Bypass -File .\scripts\windows\install.ps1`
2. Review `config/agent-workflow.local.json`
3. Start the Windows helper with `scripts/windows/claude_bridge_helper.ps1`
4. Create a Claude tmux session in WSL
5. Launch Claude inside that session
6. Emit a trigger file or call `claude_tmux_monitor.ps1`
7. Watch the visible `Claude Monitor` terminal attach

Detailed steps are in [docs/SETUP.md](/C:/Users/c/Documents/New%20project/docs/SETUP.md).

## Privacy

This repository is structured to avoid leaking machine-specific information by default.

- local settings belong in `config/agent-workflow.local.json`
- `config/*.local.json` is ignored by Git
- local startup scripts and databases are not included

## Status

This is an extracted local workflow prepared for open sharing and further extension. The repository includes reusable bridge code, but you may still want to adapt startup behavior and Hermes integration details for your own machine.
