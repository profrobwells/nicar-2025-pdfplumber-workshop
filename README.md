# `pdfplumber`: A NICAR 2025 Workshop

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/jsvine/nicar-2025-pdfplumber-workshop/HEAD)

## Local installation instructions

## Install `uv` if not already installed

```
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### Install dependencies

```
uv run make venv
```

### Test that the installation worked

```
uv run make test
```

... should not throw an error.

## Running Jupyter Lab

```
uv run make lab
```
