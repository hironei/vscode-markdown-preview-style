# vscode-markdown-preview-style
A VS Code extension that applies a consistent custom style to Markdown Preview across all workspaces.

## Mermaid

This extension only gives Mermaid diagrams a light background. Their colors are left to Mermaid, so for readable diagrams on the light preview, set the Mermaid theme to `neutral` in your user settings:

```json
{
  "markdown-mermaid.lightModeTheme": "neutral",
  "markdown-mermaid.darkModeTheme": "neutral"
}
```
