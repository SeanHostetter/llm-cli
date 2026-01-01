# llm - Local LLM CLI Helper

A powerful command-line tool for interacting with local LLMs via LM Studio. Features agentic capabilities for code exploration, web search, multi-step reasoning, and file analysis.

## Features

- 🖥️ **Analyze command output** - Run commands and get AI explanations
- 💬 **Ask questions** - General Q&A with your local LLM
- ⚡ **Quick commands** - Get the exact shell command for any task
- 📄 **Agentic file analysis** - AI explores code with tools (SYMBOLS, EXTRACT_FUNC, etc.)
- 🌐 **Agentic web search** - AI formulates its own search queries
- 🤖 **Agent mode** - AI autonomously explores your codebase
- 🧠 **Thinking mode** - Multi-step reasoning with self-critique
- 🎨 **Formatted output** - Syntax-highlighted code blocks, colored text

## Requirements

- [LM Studio](https://lmstudio.ai/) with CLI enabled
- `curl`, `jq`
- `ddgr` (for web search)
- `bat` (optional, for syntax highlighting)
- `ctags` (optional, for better function extraction)

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

### Basic Usage

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
```

### Agentic File Analysis (-o)

```bash
# Basic file explanation
llm -o config.yaml

# Ask about specific functions (AI uses tools to explore)
llm -o main.cpp -q 'what does the loadData function do?'
```

The AI can use tools like:
- `SYMBOLS` - List functions/classes
- `EXTRACT_FUNC functionName` - Extract complete function code
- `READ 50-100` - Read specific lines
- `READ_ALL` - Read entire file

### Agentic Web Search (-w)

```bash
llm -w -q 'what are the new features in Python 3.12?'
```

The AI formulates its own search queries and can do up to 3 searches before answering.

### Multi-Step Thinking (-t)

```bash
llm -t -q 'explain the halting problem'      # 2 thinking steps (default)
llm -t 4 -q 'solve this complex problem'     # 4 thinking steps
```

Uses self-critique with rotating perspectives (Skeptic, Expert, Beginner) to refine answers.

### Agent Mode (-a)

```bash
llm -a -q 'what does this project do?'       # 5 iterations (default)
llm -a 10 -q 'find the main entry point'     # 10 iterations
```

AI autonomously explores your codebase using tools:
- `TREE`, `LS_FILES` - Map directory structure
- `READ file:1-50` - Read specific lines
- `SYMBOLS file` - List functions/classes
- `EXTRACT_FUNC file:funcName` - Extract functions
- `DIFF` - Show git changes

### Model Management

```bash
llm -m                  # Switch to different model
llm -k                  # Stop LM Studio server
llm -l 8192             # Reload model with 8192 context length
```

### Debug Mode

```bash
llm -d -q 'test'        # Show raw API responses
llm -d -t -q 'test'     # Show all thinking steps
llm -d -a -q 'test'     # Show all agent iterations
```

## Options

| Flag | Description |
|------|-------------|
| `-s, --short` | Short summary (default) |
| `-v, --verbose` | Detailed analysis |
| `-q, --question` | Ask a question |
| `-c, --command` | Get shell command for a task |
| `-o, --open` | Analyze a file (agentic with tools) |
| `-w, --web` | AI-driven web search |
| `-t, --think [n]` | Multi-step thinking (default: 2 steps) |
| `-a, --agent [n]` | Agent mode with tool use (default: 5 iterations) |
| `-d, --debug` | Show all LLM responses and debug info |
| `-m, --model` | Switch loaded model |
| `-k, --kill` | Stop LM Studio server |
| `-l, --context` | Reload model with specified context length |
| `-h, --help` | Show help |

## Examples

```bash
# Debug a failing Python script
llm 'python app.py' -q 'why is this failing?'

# Explore a file's function
llm -o src/utils.cpp -q 'what does processData do?'

# Research with AI-driven search
llm -w -q 'latest developments in quantum computing'

# Deep thinking on complex problems
llm -t 4 -v -q 'explain monads in functional programming'

# Explore an unfamiliar codebase
llm -a -q 'what is the architecture of this project?'
```

## License

MIT
