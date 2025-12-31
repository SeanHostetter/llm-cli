# llm - Local LLM CLI Helper

A command-line tool for interacting with local LLMs via LM Studio. Analyze command output, ask questions, get shell commands, analyze files, and search the web.

## Features

- 🖥️ **Analyze command output** - Run commands and get AI explanations
- 💬 **Ask questions** - General Q&A with your local LLM
- ⚡ **Quick commands** - Get the exact shell command for any task
- 📄 **File analysis** - Explain code and config files
- 🌐 **Web search** - Search DuckDuckGo and get AI-summarized answers
- 🎨 **Formatted output** - Syntax-highlighted code blocks, colored text

## Requirements

- [LM Studio](https://lmstudio.ai/) with CLI enabled
- `curl`, `jq`
- `ddgr` (for web search)
- `bat` (optional, for syntax highlighting)

## Installation

```bash
# Install dependencies
./install_dependencies.sh

# Add to PATH (choose one)
sudo cp llm /usr/local/bin/
# or
ln -s $(pwd)/llm ~/.local/bin/llm
```

### LM Studio Setup

1. Download and install [LM Studio](https://lmstudio.ai/)
2. Go to Settings → Enable CLI
3. Verify: `lms --version`

## Usage

```bash
# Analyze command output
llm 'df -h'                          # Short analysis (default)
llm -v 'systemctl status nginx'      # Verbose analysis

# Ask questions
llm -q 'what is a tarball?'
llm -v -q 'explain docker networking'

# Get shell commands
llm -c 'list files by size'
llm -c 'find large files over 1GB'

# Analyze files
llm -o config.yaml
llm -o script.py -q 'what does this do?'

# Web search
llm -w -q 'what is kubernetes?'
llm -w 5 -q 'latest rust news'       # 5 search results

# Combine flags
llm 'python test.py' -q 'why is this failing?'
llm -v -w -q 'explain quantum computing'

# Model management
llm -m                               # Switch model
llm -k                               # Stop server
```

## Options

| Flag | Description |
|------|-------------|
| `-s, --short` | Short summary (default) |
| `-v, --verbose` | Detailed analysis |
| `-q, --question` | Ask a question |
| `-c, --command` | Get shell command for a task |
| `-o, --open` | Analyze a file |
| `-w, --web [n]` | Web search (default: 3 results) |
| `-m, --model` | Switch loaded model |
| `-k, --kill` | Stop LM Studio server |
| `-h, --help` | Show help |

## Examples

```bash
# Debug a failing Python script (auto-includes source code)
llm 'python app.py'

# Understand a config file
llm -o /etc/nginx/nginx.conf -q 'what ports are open?'

# Quick command lookup
llm -c 'compress folder to tar.gz'
# Output: tar -czvf archive.tar.gz folder/

# Research with web search
llm -w -q 'ChronusQ quantum chemistry'
```

## License

MIT
