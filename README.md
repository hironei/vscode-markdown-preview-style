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

## Install from a VSIX

Run `publish.bat` to build the release package. It creates the following files in `artifact/`:

```text
artifact/
├─ vscode-markdown-preview-style-v<version>.vsix
└─ install.cmd
```

Run `install.cmd` (copied from `scripts/install.cmd`) to install or update the extension with `code --install-extension --force`, then reload VS Code windows. It requires the `code` command on `PATH` and exactly one `vscode-markdown-preview-style-v*.vsix` next to it.
