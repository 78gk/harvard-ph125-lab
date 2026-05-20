# Project Context

Use this file as the lightweight handoff for any IDE or agent that opens the project.

## Current Mode

- Primary interface: GitHub Copilot in VS Code.
- Fallback interface: Antigravity or any other agent-capable IDE if Copilot rate limits are hit.
- Shared source of truth: `AGENTS.md`, `roadmap.md`, and `SESSION_STATE.md`.

## What to Read First

1. `AGENTS.md`
2. `roadmap.md`
3. `SESSION_STATE.md`
4. `WORKFLOW.md`
5. The current assignment folder under `assignments/`

## Current Phase

- Completed: Section 3 and Section 4 (Nearest Neighbors, Bootstrap). Reproducible debugging scripts saved in `scripts/`. Legacy RNG `set.seed(..., sample.kind="Rounding")` logic mapped.
- Next up: Section 5 (start next session).

## Operating Rules

- Keep changes inside the repo so context survives between IDEs and models.
- Update `SESSION_STATE.md` after each meaningful task.
- Prefer small, reproducible changes over large one-shot edits.
- Save outputs in `outputs/` and assignment work in the matching `assignments/weekXX/` folder.
