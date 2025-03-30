# docker-latex
Docker container for LaTeX

## Build

```bash
GITHUB_USER=okamumu GITHUB_TOKEN=xxxx make build
```

```bash
GITHUB_USER=okamumu GITHUB_TOKEN=xxxx make push
```

## Usage

```bash
docker pull ghcr.io/rellab/docker-latex:latest
```

## Usege with VSCode

A sample for devcontainer.json
```json
{
    "name": "docker-latex",
    "image": "ghcr.io/rellab/docker-latex:latest",
    "customizations": {
        "vscode": {
            "extensions": [
                "James-Yu.latex-workshop",
                "nopeslide.vscode-drawio-plugin-mermaid"
            ],
            "settings": {
                "editor.wordWrap": "on",
                "latex-workshop.latex.tools": [
            
                    {
                        "name": "latexmk",
                        "command": "latexmk",
                        "args": [
                            "-synctex=1",
                            "-interaction=nonstopmode",
                            "-file-line-error",
                            "-pdfdvi",
                            "-outdir=%OUTDIR%",
                            "%DOC%"
                        ],
                        "env": {}
                    },
                    {
                        "name": "lualatexmk",
                        "command": "latexmk",
                        "args": [
                            "-synctex=1",
                            "-interaction=nonstopmode",
                            "-file-line-error",
                            "-lualatex",
                            "-outdir=%OUTDIR%",
                            "%DOC%"
                        ],
                        "env": {}
                    },
                    {
                        "name": "xelatexmk",
                        "command": "latexmk",
                        "args": [
                            "-synctex=1",
                            "-interaction=nonstopmode",
                            "-file-line-error",
                            "-xelatex",
                            "-outdir=%OUTDIR%",
                            "%DOC%"
                        ],
                        "env": {}
                    },
                    {
                        "name": "latexmk_rconly",
                        "command": "latexmk",
                        "args": [
                            "%DOC%"
                        ],
                        "env": {}
                    },
                    {
                        "name": "pdflatex",
                        "command": "pdflatex",
                        "args": [
                            "-synctex=1",
                            "-interaction=nonstopmode",
                            "-file-line-error",
                            "%DOC%"
                        ],
                        "env": {}
                    },
                    {
                        "name": "bibtex",
                        "command": "bibtex",
                        "args": [
                            "%DOCFILE%"
                        ],
                        "env": {}
                    },
                    {
                        "name": "rnw2tex",
                        "command": "Rscript",
                        "args": [
                            "-e",
                            "knitr::opts_knit$set(concordance = TRUE); knitr::knit('%DOCFILE_EXT%')"
                        ],
                        "env": {}
                    },
                    {
                        "name": "jnw2tex",
                        "command": "julia",
                        "args": [
                            "-e",
                            "using Weave; weave(\"%DOC_EXT%\", doctype=\"tex\")"
                        ],
                        "env": {}
                    },
                    {
                        "name": "jnw2texminted",
                        "command": "julia",
                        "args": [
                            "-e",
                            "using Weave; weave(\"%DOC_EXT%\", doctype=\"texminted\")"
                        ],
                        "env": {}
                    },
                    {
                        "name": "pnw2tex",
                        "command": "pweave",
                        "args": [
                            "-f",
                            "tex",
                            "%DOC_EXT%"
                        ],
                        "env": {}
                    },
                    {
                        "name": "pnw2texminted",
                        "command": "pweave",
                        "args": [
                            "-f",
                            "texminted",
                            "%DOC_EXT%"
                        ],
                        "env": {}
                    },
                    {
                        "name": "tectonic",
                        "command": "tectonic",
                        "args": [
                            "--synctex",
                            "--keep-logs",
                            "%DOC%.tex"
                        ],
                        "env": {}
                    }
                ]
            }
        }
    }
}
```