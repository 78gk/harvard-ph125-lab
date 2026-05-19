# Assignment Workflow

This guide helps you solve Harvard PH125 assignments quickly using Copilot first, with Antigravity as a fallback.

## Shared Context

Always read these files first so the same context follows you across IDEs and models:

- `AGENTS.md`
- `context.md`
- `roadmap.md`
- `SESSION_STATE.md`
- The current assignment folder under `assignments/`

## 1. Prepare Assignment

- Copy assignment PDF or instructions to `assignments/week01/`
- Create `assignments/week01/README.md` with a summary (goal, data source, expected outputs)

Example README.md:
```markdown
# Week 1: Data Import and Visualization

**Goal:** Import datasets, explore structure, create exploratory plots.

**Data:** dslabs::murders dataset (built-in)

**Expected Output:**
- 3-5 exploratory plots (ggplot2)
- Summary statistics table
- Interpretation of patterns
```

## 2. Ask Your Agent (Copy-Paste One of These)

### For GitHub Copilot:
```
I have a Harvard PH125 assignment (see assignments/week01/README.md).

Read AGENTS.md, context.md, roadmap.md, and SESSION_STATE.md first.

Please:
1. Load and explore the data
2. Create 5 exploratory plots using ggplot2
3. Generate summary statistics
4. Create a Quarto notebook with all results
5. Save plots to outputs/figures/
6. Include reproducibility notes

Follow AGENTS.md rules. Use tidyverse.
```

### For Antigravity fallback:
```
Implement the full assignment from assignments/week01/README.md:

Read AGENTS.md, context.md, roadmap.md, and SESSION_STATE.md first.

1. Create assignments/week01/solution.qmd
2. Load data, perform EDA
3. Generate plots and tables
4. Include interpretations
5. Ensure reproducibility with renv

Review AGENTS.md for style and rules.
```

## 3. Review Output

- Check `outputs/figures/` for plots
- Review the generated `.qmd` file
- Run the analysis to verify it works
- Test with clean renv: `renv::status()`

## 4. Submit

```bash
git add assignments/week01/ outputs/
git commit -m "Week 1: EDA and visualization assignment complete"
```

---

**Time estimate:** 15 min setup + agent execution (5-15 min depending on model)
