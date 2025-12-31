---
title: "DevToys MCP"
description: "A Model Context Protocol (MCP) server that provides developer tools and utilities directly in Claude Desktop. Simplifies common development tasks like JSON formatting, base64 encoding, hash generation, and more - all without leaving your AI conversation."
repo_url: "https://github.com/festina-lente-io/devtoys-mcp"
weight: 10
draft: false
date: 2025-12-25
type: "projects"
---

## Prerequisites

Before installing DevToys MCP, ensure you have the following:

- **Node.js 18 or higher** - Download from [nodejs.org](https://nodejs.org/)
- **npm or yarn package manager** - Included with Node.js installation
- **Claude Desktop application** - Download from [claude.ai](https://claude.ai/download)
- **Operating System**: Windows, macOS, or Linux
- **Git** (optional) - For cloning the repository

## Installation

Install DevToys MCP globally using npm:

```bash
npm install -g devtoys-mcp
```

Or with yarn:

```bash
yarn global add devtoys-mcp
```

### Configure Claude Desktop

Add DevToys MCP to your Claude Desktop configuration:

1. Open Claude Desktop settings
2. Navigate to **Developer** → **Edit Config**
3. Add the following to your `mcpServers` configuration:

```json
{
  "mcpServers": {
    "devtoys": {
      "command": "devtoys-mcp"
    }
  }
}
```

4. Restart Claude Desktop

## Quick Start

Once installed and configured, DevToys MCP tools are available directly in Claude conversations:

### Format JSON

```
Human: Can you format this JSON for me?
{"name":"test","value":123,"nested":{"key":"value"}}
```

Claude will use the `format_json` tool to return prettified JSON.

### Encode/Decode Base64

```
Human: Encode "Hello World" to base64
```

Claude will use the `base64_encode` tool and return: `SGVsbG8gV29ybGQ=`

### Generate Hashes

```
Human: Generate an MD5 hash of "password123"
```

Claude will use the `hash_text` tool to compute cryptographic hashes (MD5, SHA-1, SHA-256, SHA-512).

### UUID Generation

```
Human: Generate a UUID for me
```

Claude will use the `generate_uuid` tool to create a new UUID v4.

## Next Steps

- **Explore All Tools**: Ask Claude "What DevToys MCP tools are available?"
- **Custom Workflows**: Combine multiple tools in a single conversation
- **Contribute**: Visit the [GitHub repository](https://github.com/festina-lente-io/devtoys-mcp) to contribute features or report issues
- **Documentation**: Read the full API documentation in the repository

## Troubleshooting

### Claude Desktop doesn't recognize DevToys MCP

**Problem**: Claude returns "Tool not found" or doesn't show DevToys MCP tools

**Solutions**:
1. Verify installation: `npm list -g devtoys-mcp`
2. Check Claude Desktop configuration file syntax (valid JSON)
3. Ensure command path is correct in configuration
4. Restart Claude Desktop completely (quit and relaunch)
5. Check Claude Desktop logs for MCP connection errors

### Installation fails with permission errors

**Problem**: `npm install -g` fails with EACCES or permission denied

**Solutions**:
- **macOS/Linux**: Use `sudo npm install -g devtoys-mcp`
- **Windows**: Run terminal as Administrator
- **Alternative**: Use npx instead: `npx devtoys-mcp` in Claude config

### Tools return errors during execution

**Problem**: DevToys MCP tools execute but return errors

**Solutions**:
1. Verify input format matches expected schema
2. Check Node.js version: `node --version` (must be 18+)
3. Update to latest version: `npm update -g devtoys-mcp`
4. Check GitHub issues for known bugs

## FAQ

### Q: Does DevToys MCP work with other AI assistants?

**A**: DevToys MCP is designed for Claude Desktop using the Model Context Protocol (MCP). It may work with other MCP-compatible clients but is not tested with other AI assistants.

### Q: Can I use DevToys MCP offline?

**A**: Yes! Once installed, DevToys MCP runs locally on your machine. All tools execute offline except for features that explicitly require internet access.

### Q: How do I update DevToys MCP?

**A**: Run `npm update -g devtoys-mcp` to update to the latest version. Check the [releases page](https://github.com/festina-lente-io/devtoys-mcp/releases) for changelogs.

### Q: Is DevToys MCP secure for sensitive data?

**A**: DevToys MCP runs locally and does not send data to external servers. However, be cautious when processing sensitive information in Claude conversations, as Claude Desktop may transmit conversation data to Anthropic's servers.

### Q: Can I add custom tools to DevToys MCP?

**A**: DevToys MCP is extensible! See the [contributing guide](https://github.com/festina-lente-io/devtoys-mcp/blob/main/CONTRIBUTING.md) for instructions on adding new tools.

### Q: What's the difference between DevToys MCP and the original DevToys?

**A**: [DevToys](https://devtoys.app/) is a standalone desktop application. DevToys MCP brings similar utilities to Claude Desktop via the Model Context Protocol, allowing you to use developer tools without leaving your AI conversation.

## Advanced Usage

### Custom Configuration

Create a `.devtoysrc.json` file in your home directory for custom settings:

```json
{
  "defaultHashAlgorithm": "sha256",
  "jsonIndentSpaces": 2,
  "maxFileSize": "10MB"
}
```

### Programmatic Usage

Use DevToys MCP as a library in your own Node.js projects:

```javascript
const { DevToysServer } = require('devtoys-mcp');

const server = new DevToysServer();
const result = await server.formatJson('{"test": "value"}');
console.log(result);
```

### Integration with Other MCP Servers

DevToys MCP works alongside other MCP servers. Configure multiple servers in Claude Desktop:

```json
{
  "mcpServers": {
    "devtoys": {
      "command": "devtoys-mcp"
    },
    "filesystem": {
      "command": "mcp-server-filesystem"
    }
  }
}
```

Claude will intelligently choose the appropriate server based on your requests.

### Performance Tuning

For large datasets or high-frequency usage:

- Increase Node.js memory limit: `node --max-old-space-size=4096`
- Use streaming APIs for large file processing
- Configure timeouts in `.devtoysrc.json`

### Example Workflows

**Workflow 1: API Response Processing**
```
1. Format JSON response from API
2. Encode sensitive fields to base64
3. Generate hash for cache key
4. Validate UUID format
```

**Workflow 2: Configuration File Management**
```
1. Format YAML/JSON configuration
2. Generate unique IDs for entries
3. Encode secrets to base64
4. Validate schema
```

All steps can be done in a single Claude conversation using DevToys MCP tools!
