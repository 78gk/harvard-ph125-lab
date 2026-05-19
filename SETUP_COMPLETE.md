# Setup Complete ✓

Your Harvard PH125 autonomous data-science lab is ready!

## What's Installed

- ✓ Git repository initialized
- ✓ Project folder structure
- ✓ R 4.6.0 (via Chocolatey)
- ✓ Quarto 1.9.37 (for reports)
- ✓ renv initialized with 140+ R packages
- ✓ VS Code configured for R/Quarto
- ✓ Agent setup guides (Copilot-first, Antigravity fallback, plus Ollama/OpenRouter notes)

## Quick Start

### 1. Open the Project in VS Code
```powershell
cd "c:\projects\Building Machine Learning Models\harvard-ph125-lab"
code .
```

### 2. Start an R Session

Use proper cmd syntax to avoid PowerShell issues:
```powershell
cmd /c "cd /d c:\projects\Building^ Machine^ Learning^ Models\harvard-ph125-lab && C:\Program Files\R\R-4.6.0\bin\R.exe"
```

Then in R:
```r
renv::activate()
```

### 3. Create an Assignment

Put the assignment PDF or instructions in `assignments/week03/`.

### 4. Ask an Agent

Open **GitHub Copilot** in VS Code and paste a prompt from `prompts/copilot-starter.md`.

If Copilot hits a rate limit, open the same folder in Antigravity and continue from `context.md` and `SESSION_STATE.md`.

Example:
```
Analyze the assignment in assignments/week03/README.md
and create a starter Quarto notebook.
```

### 5. Review, Commit, Submit

```bash
git status
git add .
git commit -m "Week 3 assignment: complete analysis"
```

## File Reference

| File | Purpose |
|------|---------|
| `AGENTS.md` | Project rules for all AI agents |
| `roadmap.md` | Assignment tracking |
| `README.md` | Project overview |
| `ROO_SETUP.md` | Configure Roo Code |
| `CLINE_SETUP.md` | Configure Cline |
| `OLLAMA_SETUP.md` | Local AI models |
| `OPENROUTER_SETUP.md` | Cloud models (Claude/GPT) |
| `prompts/` | Starter prompts for agents |
| `memory/` | Session logs and run notes |
| `assignments/` | Your weekly assignments |
| `notebooks/` | Exploratory notebooks |
| `scripts/` | Reusable R scripts |
| `outputs/` | Reports, plots, tables |
| `renv.lock` | Reproducible package versions |

## Next Steps

1. **Install an AI Agent:**
   - GitHub Copilot: VS Code Extensions → GitHub Copilot
   - Antigravity: use as the fallback IDE if Copilot rate limits are hit

2. **Choose a Model Source:**
   - **Primary:** Copilot built into VS Code
   - **Fallback:** Antigravity model access if Copilot rate limits are hit
   - **Optional local/cloud extras:** Ollama or OpenRouter if you want them later

3. **Add Your First Assignment:**
   - Copy assignment PDF to `assignments/week01/`
   - Create `README.md` with assignment summary
   - Ask agent to generate starter notebook

4. **Run Your First Analysis:**
   - Follow agent suggestions
   - Review outputs in `outputs/figures/` and `outputs/reports/`
   - Commit to git when done

## Agent Decision Tree

```
Copilot available?
├─ Yes → Use Copilot in VS Code
└─ No or rate-limited → Open the same folder in Antigravity
```

## PowerShell Alias (Optional)

Add to your PowerShell profile to quickly start R in this project:

```powershell
function r-lab {
  cmd /c "cd /d c:\projects\Building^ Machine^ Learning^ Models\harvard-ph125-lab && C:\Program Files\R\R-4.6.0\bin\R.exe"
}
```

Then just type: `r-lab`

## Troubleshooting

### R not found
- Check: `Test-Path "C:\Program Files\R\R-4.6.0\bin\Rscript.exe"`
- If missing, re-run: `scripts\bootstrap_full.ps1 -InstallTools` (as Admin)

### Quarto not found
- Run: `quarto --version`
- If missing, re-run bootstrap script (Admin)

### VS Code terminal crashes on startup
- Terminal now uses PowerShell (NoProfile) to avoid profile errors.
- If issues persist, check: `.vscode/settings.json`

### renv package issues
- Run in R: `renv::status()` to check state
- Re-snapshot: `renv::snapshot()`

## Support & Resources

- **Harvard PH125:** https://pll.harvard.edu/series/data-science-series
- **R for Data Science:** https://r4ds.hadley.nz
- **Quarto:** https://quarto.org
- **Tidyverse:** https://www.tidyverse.org
- **Roo Code:** https://roocode.com
- **Cline:** https://github.com/cline/cline
- **Ollama:** https://ollama.com
- **OpenRouter:** https://openrouter.ai

---

**Ready to start?** Pick an assignment, open an agent, and ask it to help you solve it.

Your autonomous lab is now live. Good luck! 🚀
