# Ollama Setup (Local AI Models)

## Why Ollama?

Run coding models locally without cloud costs or API delays. Great for:
- Editing and cleanup
- Documentation generation
- Lightweight coding tasks

## Installation

1. Download from https://ollama.com
2. Install and restart your machine.
3. Verify installation:
```bash
ollama --version
```

## Recommended Models

### For R / Data Science

```bash
ollama pull qwen2.5-coder
ollama pull deepseek-coder
```

### For General Use

```bash
ollama pull llama3
ollama pull llama2
```

## Running Ollama

Ollama runs a local API on `http://localhost:11434` by default.

To start (if not auto-running):
```bash
ollama serve
```

To run a model interactively:
```bash
ollama run qwen2.5-coder
```

## Integration with Roo/Cline

Both Roo and Cline can point to your local Ollama instance. This keeps data local and reduces cloud costs.

Performance tip: Ollama works best with models ≤13B parameters on consumer hardware. For larger models or complex reasoning, use OpenRouter (cloud).
