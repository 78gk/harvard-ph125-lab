Contributing to this repository

- Work on short-lived branches: `feature/<short-description>` or `section7-complete`.
- Keep commits atomic and with clear messages (one logical change per commit).
- If you change R package requirements, run `renv::snapshot()` and commit `renv.lock`.
- Include reproducible commands or script outputs for results validation.
- Add or update tests (or a smoke-check script) for any non-trivial analysis.
- Open a Pull Request and request at least one review before merging to `main`.

Code style

- Prefer tidyverse-style code in analysis scripts.
- Avoid changing unrelated files or reformatting large files in the same commit.

Troubleshooting

- If CI fails due to package issues, run `renv::restore()` locally and reproduce the failure before opening an issue.

Contact

- Maintainers and session notes are tracked in `SESSION_STATE.md`.