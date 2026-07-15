# nanox

Dockerized [OpenCode](https://opencode.ai) server for headless AI-assisted coding.

## Quick Start

```bash
docker build -t nanox .
docker run -p 4096:4096 -v $(pwd):/workspace nanox
```

The server exposes an OpenAPI endpoint at `http://localhost:4096/doc`.

## Environment Variables

| Variable | Description | Default |
|---|---|---|
| `OPENCODE_CONFIG` | Path to custom config file | — |
| `OPENCODE_PORT` | Port to listen on | `4096` |
| `OPENCODE_HOST` | Hostname to bind | `0.0.0.0` |
| `OPENCODE_CORS` | Comma-separated allowed CORS origins | — |
| `OPENCODE_SERVER_PASSWORD` | Enable HTTP basic auth | — |
| `OPENCODE_SERVER_USERNAME` | Basic auth username | `opencode` |

## Example

```bash
docker run \
  -e OPENCODE_CONFIG=/workspace/opencode.json \
  -e OPENCODE_CORS=http://localhost:3000,https://app.example.com \
  -p 4096:4096 \
  -v $(pwd):/workspace \
  nanox
```

## What's Included

- Node.js 22
- [opencode-ai](https://www.npmjs.com/package/opencode-ai)
- [OpenAI Codex CLI](https://www.npmjs.com/package/@openai/codex)