# homebrew-tap

Personal [Homebrew](https://brew.sh) tap for apps that have **no official cask** — installed and
kept up to date like any other Homebrew package.

```sh
brew tap wawrzdev/tap
brew install --cask wawrzdev/tap/nuvio
brew install --cask wawrzdev/tap/graphite
```

## Casks

| Cask | App | Source | Checksum |
|---|---|---|---|
| `nuvio` | Nuvio media desktop (alpha) | [GitHub Releases](https://github.com/NuvioMedia/NuvioDesktop/releases) | per-arch DMG; sha256 from the API asset digest |
| `graphite` | Graphite stacked-PR menu bar app | S3 `latest-mac.yml` (electron-updater) | universal DMG; sha256 computed from the artifact |

Both set `auto_updates true`, so the apps self-update after install; the cask version only needs to
be recent enough for a *fresh* install (the bot below keeps it current).

## Updates

A daily GitHub Action (`.github/workflows/autobump.yml` → `scripts/bump-casks.sh`) bumps each cask to
the latest upstream version. The apps also self-update (`auto_updates true`).

## Adding a cask

1. Add `Casks/<name>.rb` — follow the two existing casks (`arch`, pinned `sha256`, `livecheck`, `zap`).
2. If it should auto-bump, add a branch to `scripts/bump-casks.sh`.
3. Reference it from the dotfiles Brewfile: `cask "wawrzdev/tap/<name>"`.

Referenced by the private [`wawrzdev/dotfiles`](https://github.com/wawrzdev/dotfiles) Brewfile.
