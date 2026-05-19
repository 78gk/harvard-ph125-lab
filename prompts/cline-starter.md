# Cline Starter Prompts

Use these with Cline for multi-file editing and project-wide changes.

## Prompt 1: Setup Assignment Skeleton

```
Create a complete assignment structure for Harvard PH125 Week 3 with:

1. assignments/week03/README.md — assignment summary
2. assignments/week03/assignment.R — starter R script
3. assignments/week03/report.qmd — Quarto notebook template
4. outputs/figures/.gitkeep — placeholder
5. renv snapshot update

Follow AGENTS.md rules. Use tidyverse style.
```

## Prompt 2: Implement Full Analysis

```
Implement a complete data analysis pipeline:

1. Load and clean a dataset (use a sample dataset if needed).
2. Perform EDA with 5+ plots.
3. Build a simple predictive model using caret.
4. Create a Quarto report with results.
5. Save all outputs to outputs/ folder.

Use ggplot2, tidyverse, and rmarkdown best practices.
Validate reproducibility with renv.
```

## Prompt 3: Refactor Project

```
Refactor this project for production readiness:

1. Move repeated code into scripts/utils.R
2. Add comments and roxygen-style docstrings.
3. Create a master run script (scripts/run_analysis.R).
4. Update renv.lock if needed.
5. Create a brief WORKFLOW.md documenting the pipeline.

Follow R best practices from AGENTS.md.
```

## Prompt 4: Generate Presentation Slides

```
Create a Quarto presentation (.qmd with reveal.js) that:

1. Summarizes the data analysis from outputs/
2. Includes 3-5 key findings with visualizations.
3. Has a "Reproducibility" slide explaining renv/Quarto.
4. Can be rendered to HTML or PDF.

Use professional styling and clear narratives.
```
