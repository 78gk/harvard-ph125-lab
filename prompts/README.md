# prompts/

Place canonical agent prompts here. Name files by intent (e.g., `analyze-assignment.q.txt`).

Copilot should use `prompts/copilot-starter.md`.
Fallback IDEs should reuse the same prompt content and read `context.md` plus `SESSION_STATE.md` first.

Agents should append run metadata to `memory/` after execution and update `SESSION_STATE.md` when the project state changes.
