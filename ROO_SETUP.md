# Roo Code Setup

## Installation

1. Open VS Code.
2. Go to Extensions (Ctrl+Shift+X).
3. Search for "Roo Code" and install.
4. Reload VS Code.

## Configuration

### Local Models (Ollama)

1. Install Ollama from https://ollama.com
2. Pull a coding model:
```bash
ollama pull qwen2.5-coder
```
3. In VS Code, open Roo settings and set:
   - **Model provider:** Ollama
   - **Base URL:** `http://localhost:11434`
   - **Model name:** `qwen2.5-coder`

### Cloud Models (OpenRouter)

1. Create an account at https://openrouter.ai
2. Get your API key from the dashboard.
3. In VS Code Roo settings:
   - **Model provider:** OpenRouter
   - **API key:** (paste your OpenRouter key)
   - **Model name:** Pick from: `anthropic/claude-3.5-sonnet`, `openai/gpt-4-turbo`, `deepseek/deepseek-coder`

## Using Roo with this Project

1. Open the project folder in VS Code.
2. Open Roo (usually a sidebar icon or Ctrl+Shift+R).
3. Paste a prompt from `prompts/` or ask Roo directly.
4. Let Roo read the entire project context (it will auto-discover files).
5. Tell Roo: "Use the rules in AGENTS.md when responding."

## Example Prompt

```
Analyze this Harvard PH125.8x assignment and break it into subtasks.
Identify required R packages and datasets. Generate a starter Quarto notebook.
Always follow the rules in AGENTS.md.
```
