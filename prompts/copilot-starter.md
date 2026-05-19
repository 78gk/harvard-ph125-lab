# Copilot Starter Prompts

Use these prompts in GitHub Copilot Chat or Copilot Agent mode.

## Analyze Assignment

I have a Harvard PH125 assignment in `assignments/week01/README.md`.

Read `AGENTS.md`, `context.md`, `roadmap.md`, and `SESSION_STATE.md` first.

Then:
1. Break the assignment into concrete subtasks.
2. Identify the data, packages, and outputs needed.
3. Create or update the assignment scaffold.
4. Keep the work reproducible with `renv` and Quarto.

## Implement Assignment

Use the current assignment folder under `assignments/`.

Read `AGENTS.md`, `context.md`, and `SESSION_STATE.md` first.

Then implement the assignment end to end with tidyverse, Quarto, and outputs saved under `outputs/`.

## Rate Limit Fallback

If Copilot is rate limited, open the same folder in Antigravity and continue from `context.md`, `roadmap.md`, and `SESSION_STATE.md`.
