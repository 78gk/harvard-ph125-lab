# Harvard PH125 Mini Lab

This repository is a self-contained autonomous data-science lab tailored for the Harvard PH125.8x course. It is optimized for reproducible R work, AI-assisted coding, Quarto reporting, and multi-agent collaboration.

Quick scaffold layout:

```
harvard-ph125-lab/
├── datasets/
├── notebooks/
├── assignments/
├── outputs/
├── scripts/
├── prompts/
├── memory/
├── references/
├── .vscode/
├── renv/
├── AGENTS.md
├── README.md
├── roadmap.md
├── TODO.md
└── requirements.txt
```

Quick start (PowerShell):

```powershell
cd "c:\projects\Building Machine Learning Models\harvard-ph125-lab"
# create a git repo (if needed)
git init
# run bootstrap to install local tools (review script before running)
.
\scripts\bootstrap.ps1
```

Next steps: run the bootstrap script, review `AGENTS.md`, and initialize `renv` from R.

**Project scripts & runner**

- Scripts live in the `scripts/` folder. Key analysis scripts added during this session:
	- `scripts/section6_answers.R` — MNIST ensemble answers
	- `scripts/movielens_section_answers.R` — MovieLens exercise answers
	- `scripts/schools_regularization_answers.R` — School simulation and regularization
	- `scripts/svd_q3_compute.R` — SVD exercise helper
	- `scripts/run_all.ps1` — PowerShell runner to execute the above scripts (uses `Rscript` and `renv/activate.R`).

Run the scripts (PowerShell):
```powershell
# optionally set full path to Rscript.exe if not on PATH
.
\scripts\run_all.ps1 -Rscript 'C:\Program Files\R\R-4.6.0\bin\Rscript.exe'
```

Generated figures are saved to `outputs/figures/` by default.

Reproducibility & CI

- This project uses `renv` to snapshot and restore package versions. After installing or updating packages, run from R:

```r
renv::snapshot()
```

- Recommended CI: run `renv::restore()` and then execute key scripts (for example, `scripts/section7_answers.R`) to ensure reproducible outputs.

Recommended Git workflow

- Create a short-lived feature branch for changes: `git checkout -b section7-complete`.
- Commit focused changes and include `renv.lock` if you snapshot dependencies.
- Push and open a pull request for review before merging to `main`.
