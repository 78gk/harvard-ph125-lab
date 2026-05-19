# Week 01 - Data Import and Visualization

## Assignment Summary

**Course:** Harvard PH125.8x - Data Science and Machine Learning

**Week:** 1 - Getting Started

**Learning Objectives:**
- Import data using readr/base R
- Explore data structure and distributions
- Create publication-quality visualizations with ggplot2

## Problem Statement

Explore the `dslabs::murders` dataset (or your assignment dataset) and:
1. Load the data
2. Describe its structure (rows, columns, types)
3. Create 5+ exploratory plots
4. Summarize key findings

## Data Source

- **Dataset:** `dslabs::murders` (built-in to dslabs package)
- **Rows:** US states + DC
- **Columns:** State, total murders, population, murder rate
- **Format:** tibble/data.frame

## Expected Deliverables

1. ✓ `solution.qmd` — Quarto notebook with full analysis
2. ✓ Plots saved to `outputs/figures/`
3. ✓ Summary statistics and interpretation
4. ✓ Reproducibility notes (renv, package versions)

## Submission Checklist

- [ ] Data loaded and explored
- [ ] At least 5 plots created
- [ ] All plots saved to `outputs/figures/`
- [ ] Quarto document renders without errors
- [ ] renv snapshot updated
- [ ] Git commit with descriptive message

## Notes

- Follow tidyverse conventions (use dplyr, ggplot2, tidyr)
- Include inline comments explaining each step
- Make plots publication-ready (titles, labels, legends)
- Test reproducibility: can a clean R session run all code?

---

**Ready to start?** 

1. Copy this file to `assignments/week01/README.md`
2. Open Roo/Cline in VS Code
3. Paste the prompt from `WORKFLOW.md`
4. Review the output and submit
