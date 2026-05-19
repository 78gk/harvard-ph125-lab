# Roo Code Starter Prompts

Use these with Roo Code to automate common tasks.

## Prompt 1: Analyze Assignment

```
I am working on a Harvard PH125.8x data science assignment.

Please:
1. Summarize the assignment goals.
2. Break into numbered subtasks.
3. Identify required R packages and datasets.
4. Suggest file structure.
5. Generate a starter Quarto notebook template.

Follow the rules in AGENTS.md.
```

## Prompt 2: Generate Report

```
Create a professional Quarto report (.qmd) with:
- Title and author (Harvard PH125 Lab)
- R code chunks for data import
- Data exploration and summary statistics
- Plots using ggplot2 saved to outputs/figures/
- Interpretation of results
- Reproducibility note about renv

Follow tidyverse style from AGENTS.md.
```

## Prompt 3: Debug Script

```
This R script has an error. Please:
1. Identify the bug.
2. Explain why it fails.
3. Provide a fixed version.
4. Include a small test case.

Script:
[paste your code]
```

## Prompt 4: Code Review

```
Review this R code for:
- Correctness (does it do what we want?)
- Performance (any inefficiencies?)
- Reproducibility (will it work in a clean renv?)
- Style (does it follow tidyverse?)

Suggest improvements.

Code:
[paste your code]
```
