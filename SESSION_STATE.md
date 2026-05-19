# Session State

This file should be updated during the session so Copilot, Antigravity, or any future model can resume from the same context.

## Current Goal

- Build assignment solutions quickly while keeping them reproducible in R and Quarto.

## Current Setup

- R 4.6.0 is installed.
- Quarto is installed.
- renv is initialized.
- VS Code is configured for PowerShell without profile loading.

## Workflow Status

- Project-level context lives in `context.md` and `roadmap.md`.
- Assignment workflow lives in `WORKFLOW.md`.
- Model-specific prompts live in `prompts/`.

## Fallback Rule

- If Copilot hits a rate limit, open the same project folder in Antigravity and continue from `context.md`, `roadmap.md`, and this file.

## Recent Actions (2026-05-19)

- Completed Section 3 (Linear regression).
- Completed Section 4 (Nearest Neighbors, Bootstrap).
- Discovered and addressed grading engine quirks: 
        - The `set.seed` requires `sample.kind="Rounding"` for backward compatibility with R 3.5.
        - Evaluated differing tie-breaker behaviors between `class::knn` and `caret::knn3`.
        - Verified that the expected Harvard train/test splits usually follow `train_set <- data[-test_index, ]`.
- Handled Monte Carlo and Bootstrap standard error / expected value calculations for the 75th quantile.

## Session Summary (2026-05-19)

- Finished: Section 3 and Section 4.
- Next: Begin Section 5 in the next session.

## Next Recommended Steps

- Begin by checking reading materials for Section 5.
- If there are dataset requirements for Section 5, ensure they are downloaded.

## Remote

- Remote origin: https://github.com/78gk/harvard-ph125-lab
- Pushed local `master` to remote `main` (branch tracking set to `origin/main`)

