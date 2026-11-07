# Read by every zsh. Keep it in sync with ~/.profile, which login shells and the
# lightdm X session read instead (so apps started from i3/rofi get the same PATH).

# ~/.local/bin (pipx, uv, claude, etc)
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

# Node Version Manager (the nvm package installs it to /usr/share/nvm)
export NVM_DIR="$HOME/.nvm"
export NVM_SOURCE="/usr/share/nvm"
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"
