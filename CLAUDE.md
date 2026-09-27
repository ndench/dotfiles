# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal Linux dotfiles (Arch, i3 on X11) managed with [rcm](https://github.com/thoughtbot/rcm). There is no build or test step: files here are live config, symlinked into `$HOME`.

## How rcm maps files

- Files under `tag-<name>/` are linked into `~` with a leading dot: `tag-new-dotfiles/config/i3/config` → `~/.config/i3/config`, `tag-new-dotfiles/zshrc` → `~/.zshrc`.
- rcm links **individual files**, not directories. Editing an existing file here changes the live config immediately. A **new** file has no symlink until you run `rcup -t new-dotfiles` (or `mkrc -t new-dotfiles <path>` to move an existing `~` file into the repo and link it back).
- `tag-new-dotfiles/rcrc` (linked to `~/.rcrc`) sets `EXCLUDES="README.md CLAUDE.md"` and `UNDOTTED="bin"`, so `tag-*/bin/*` links to `~/bin/` without a dot. Other top-level files also get linked (e.g. `Makefile` → `~/.Makefile`).
- `tag-new-dotfiles` is the active tag. `tag-old-dotfiles` is a legacy config (compton, urxvt-era); don't edit it unless asked.

## Commands

- `make check`: diff the live `~/.config/mimeapps.list` against the repo copy (apps rewrite this file, which replaces the symlink with a real file).
- `make update`: pull the live `mimeapps.list` back into the repo via `mkrc`.
- `lsrc -t new-dotfiles`: list what rcm would link and where.
- Apply changes: i3 `$Mod+Shift+c` (reload) or `$Mod+Shift+r` / `i3-msg restart`; polybar via `polybar-session`; zsh by opening a new shell; `xprofile` only on next login.

## Desktop wiring (spans several files)

- `xprofile` runs at login: starts picom, tray applets (nm-applet, blueman, volumeicon), nitrogen wallpaper, polkit/keyring, and sets `xset` DPMS and key repeat.
- `config/i3/config` is the window manager: keybindings, autostart `exec`s (xautolock/i3lock, drata-agent), and launchers that call scripts in `bin/` (`rofi_run -r/-l/-q` for run, logout and quit menus). Terminal is ghostty (`config/ghostty`).
- `config/polybar/config` includes `master.conf` and `modules.conf` by **absolute path** (`/home/nathan/.config/polybar/...`); bars are chosen by `bin/polybar-session` using `config/polybar/sessions`.
- Zsh uses a small in-repo framework rather than oh-my-zsh: `zshrc` sources every `~/.zsh/{settings,plugins}/*.zsh` and loads the `simpl` prompt from `zsh/themes/`. Add aliases/functions to the matching file in `zsh/settings/`, not to `zshrc`.
- Vim: `vimrc` + `vim/` for Vim, `config/nvim/init.vim` for Neovim, `ideavimrc` for JetBrains.
