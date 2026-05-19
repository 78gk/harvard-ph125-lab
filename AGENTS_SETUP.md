# Agent setup guides

This file contains setup notes and links for the Copilot-first workflow and fallback tool stacks used with this project.

Copilot
- Use GitHub Copilot in VS Code as the primary workflow.
- Read `AGENTS.md`, `context.md`, `roadmap.md`, and `SESSION_STATE.md` before making changes.

Antigravity
- Use Antigravity only as a fallback if Copilot hits a rate limit.
- Open the same repo folder and continue from the same context files.

Roo Code
- Install from VS Code marketplace or follow Roo Code docs.
- Configure Roo to point at local models (Ollama) or OpenRouter API keys.

Cline
- Install via the Cline project instructions. Use MCP filesystem and memory plugins.

Ollama (local models)
- Install Ollama from https://ollama.com
- Pull recommended models for coding and summarization:
  - `qwen2.5-coder`
  - `llama3`
- Configure local API endpoint and set environment variable `OLLAMA_HOST`.

OpenRouter (cloud API)
- Create an account and set `OPENROUTER_API_KEY` in your environment.
- Use OpenRouter to route requests to Claude/GPT models as required.

Safety notes
- Always review agent prompts in `prompts/` before executing with an autonomous agent.
- Agents must append run metadata to `memory/` after each execution and update `SESSION_STATE.md` when the project state changes.
