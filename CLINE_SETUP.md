# Cline Setup

## Installation

1. Open VS Code.
2. Go to Extensions (Ctrl+Shift+X).
3. Search for "Cline" and install.
4. Reload VS Code.

## Configuration

### Local Models (Ollama)

1. Install Ollama from https://ollama.com
2. Pull a coding model:
```bash
ollama pull qwen2.5-coder
```
3. In VS Code Cline settings:
   - **API provider:** Custom (or Ollama if supported)
   - **Base URL:** `http://localhost:11434/api/generate`
   - **Model:** `qwen2.5-coder`

### Cloud Models (OpenRouter)

1. Create an account at https://openrouter.ai
2. Get your API key.
3. In VS Code Cline settings:
   - **API provider:** OpenRouter
   - **API key:** (paste your key)
   - **Model:** Choose one: `anthropic/claude-3.5-sonnet`, `openai/gpt-4-turbo`

## MCP Server Integration (Optional)

Enable MCP tools for better autonomy:

1. File operations (safer sandboxed edits)
2. Memory (persistent context across sessions)
3. Browser automation (web research)

Configure in Cline settings under "MCP Servers".

## Using Cline with this Project

1. Open Cline (usually icon in VS Code sidebar).
2. Ask Cline to analyze an assignment or implement a task.
3. Reference AGENTS.md and roadmap.md in your prompts.
4. Review suggested edits before approving.
5. Cline will create multi-file changes safely.

## Example Prompt

```
I have a Harvard PH125 assignment to implement data cleaning and EDA in R.
Review AGENTS.md and create a Quarto notebook with:
- Data import
- Data cleaning steps
- EDA plots saved to outputs/figures/
- Reproducibility notes
```
