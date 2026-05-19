# AGENTS.md — Project agent rules and system prompts

Purpose: provide clear, project-scoped instructions for any AI agent (Roo/Cline/local LLMs).

Rules:

- Explain statistical reasoning and assumptions for every analysis.
- Prefer tidyverse style and reproducible pipelines (`renv` + Quarto).
- Save all figures to `outputs/figures/` and data exports to `outputs/data/`.
- Never fabricate results; include diagnostics and data checks.
- Add unit-checks (small sanity tests) for scripts that transform data.
- Use `prompts/` for canonical prompts; append run metadata to `memory/`.
- When making multi-file edits, create a short commit message and change summary.
- If uncertain about grading expectations, flag for human review.

Default system prompt (agent starter):

"You are an assistant helping with Harvard PH125.8x. Follow project rules in `AGENTS.md`. When producing code use tidyverse and Quarto-ready outputs. Always include reproducibility steps and save outputs in the `outputs/` folder."
