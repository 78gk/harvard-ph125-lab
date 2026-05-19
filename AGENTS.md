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

## Extended Rules for Autonomous Agents

### Code Quality

- Use meaningful variable names (avoid `x`, `df1`, etc.).
- Add inline comments for complex operations.
- Include error handling (e.g., `stopifnot()`, assertions).
- Test edge cases: empty data, NA values, single observations.

### Data Handling

- Always check data shape and types: `str()`, `summary()`, `head()`.
- Report missing values explicitly.
- Validate data cleaning steps with before/after comparisons.
- Document any assumptions about data source or collection.

### Visualization

- Use `ggplot2` consistently.
- Add titles, axis labels, legends.
- Save plots to `outputs/figures/` with descriptive names.
- Ensure plots are reproducible (no hardcoded data paths).

### Reporting

- Use Quarto `.qmd` files for final reports.
- Include R version and package versions in reports.
- Add a "How to Reproduce" section explaining renv and Quarto rendering.
- Cite data sources and any external references.

### Version Control

- Commit after each logical task.
- Include descriptive commit messages: `Fix outlier detection in EDA` not `update code`.
- Never commit `renv/library/` or `.Rhistory` (already in `.gitignore`).
