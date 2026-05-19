# OpenRouter Setup (Cloud Models)

## Why OpenRouter?

Single API to access Claude, GPT, Gemini, DeepSeek, and more. Pay-per-token and route to cheaper models automatically.

## Account Setup

1. Go to https://openrouter.ai
2. Sign up and log in.
3. Go to Settings → API Keys.
4. Create and copy your API key.

## Model Recommendations

| Task | Model | Cost | Speed |
|------|-------|------|-------|
| Complex reasoning | `anthropic/claude-3.5-sonnet` | $$$ | Medium |
| Statistical explanations | `openai/gpt-4-turbo` | $$$ | Medium |
| Quick coding | `deepseek/deepseek-coder` | $ | Fast |
| Large context (128K) | `google/gemini-2.0-flash` | $$ | Fast |

## Integration with Roo/Cline

### Roo Code

Settings → Model Provider: OpenRouter
```
API Key: [your-key]
Base URL: https://openrouter.ai/api/v1
Model: anthropic/claude-3.5-sonnet
```

### Cline

Settings → API Provider: OpenRouter
```
API Key: [your-key]
Model: anthropic/claude-3.5-sonnet
```

## Environment Variable (Optional)

Set once to avoid re-entering the key:

```powershell
$env:OPENROUTER_API_KEY="your-api-key-here"
```

Or add to your PowerShell profile for persistence.

## Cost Monitoring

Check your usage at https://openrouter.ai/activity to monitor spend.
