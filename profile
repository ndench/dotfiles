# Read by login shells and the lightdm X session. Keep it in sync with ~/.zshenv.

# ~/bin (scripts from these dotfiles, eg. rofi_run which the i3 keybindings call) and
# ~/.local/bin (pipx, uv, claude, etc)
for dir in "$HOME/.local/bin" "$HOME/bin"; do
  case ":$PATH:" in
    *":$dir:"*) ;;
    *) PATH="$dir:$PATH" ;;
  esac
done
unset dir
export PATH

# Node Version Manager (the nvm package installs it to /usr/share/nvm)
export NVM_DIR="$HOME/.nvm"
export NVM_SOURCE="/usr/share/nvm"
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"
