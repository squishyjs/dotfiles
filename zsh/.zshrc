# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Python user-installed scripts (pip --user)
export PATH="$HOME/Library/Python/3.11/bin:$PATH"

# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to LazyGit config
export XDG_CONFIG_HOME="$HOME/.config"

# Path to Tmux config
export TMUX_CONF="$HOME/.config/tmux/.tmux.conf"
if [ -n "$TMUX" ] && [ -f "$TMUX_CONF" ]; then
  tmux source-file "$TMUX_CONF"
fi

# Path to Ruby
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

# zsh Theme Load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Auto update (frequency=14 days)
zstyle ':omz:update' frequency 14

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-bat
  zsh-history-substring-search
)

# You should use (Plugin)
source /opt/homebrew/share/zsh-you-should-use/you-should-use.plugin.zsh
source $ZSH/oh-my-zsh.sh

# ALIASES
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias python=python3
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2 --icons --git"
alias ltr="eza --tree --level=2 --icons --git"

# Git
alias all="git add ."
alias sendit="git push origin main"
alias main="git push origin main"
alias master="git push origin master"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gcm="git commit -m"
alias gr="git remote"
alias gre="git reset"
alias add="git add"
alias gdiff="git diff"
alias gh="git help"
alias gpl="git pull"

# Alacritty
export TERM="alacritty"

# Neovim
# alias vim="nvim"

# Neofetch
alias mac="neofetch"

# Config
alias reload-config="source ~/.config/zsh/.zshrc"

# Zoxide
alias cdi="zi"

# Lazygit
alias lgit="lazygit"

# Yazi
alias dir="yazi"

# BONSAI!
alias bonsai="cbonsai -l -i"

# Clang-format
alias clang_all="clang-format -i *.cpp *.hpp *.h"

# Pip
alias pi="pip install"

# Tmux
alias attach="tmux attach"
alias detach="tmux detach"

# Fzf
alias ff="fzf --height 40% --layout reverse --border --tmux bottom"

# Makefile
alias mclean="make clean"

# Generic C build (c17)
function build_c() {
  if [[ -z "$1" ]]; then
    echo "Please enter a C source file"
    return 1
  fi

  local src_file="$1"
  local output_name="${2:-a.out}"

  /usr/bin/gcc -std=c11 -Wall -Wextra "$src_file" -o "$output_name"
}

# Generic Clang++ build (standard c++20)
build_clang() {
  if [ -z "$1" ]; then
    echo "Please enter a C++ source file."
    return 1
  fi

  src_file=$1
  output_name=${2:-a.out}

  clang++ -std=c++20 -Wall -Wextra "$src_file" -o "$output_name"
}

# Generic Clang++ build (using Google Test, c++ 20)
build_gtest_clang() {
  if [ -z "$1" ]; then
    echo "Please enter a C++ source file."
    return 1
  fi

  src_file=$1
  output_name=${2:-main}  # Default output is 'main' if no second argument is provided

  clang++ -std=c++20 -I/opt/homebrew/Cellar/googletest/1.16.0/include \
         -L/opt/homebrew/Cellar/googletest/1.16.0/lib \
         "$src_file" -lgtest -lgtest_main -pthread -o "$output_name"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /Users/john/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# CUSTOM MAPPINGS AND BINDINGS
# Map tab to accept autosuggestion
bindkey '^I' autosuggest-accept

# Toggle between full path and shortened directory name
function toggle_path() {
  if [[ "$POWERLEVEL9K_SHORTEN_STRATEGY" == "truncate_to_last" ]]; then
    export POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
    export POWERLEVEL9K_DIR_SHOW_FULL_PATH=true
  else
    export POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"
    export POWERLEVEL9K_DIR_SHOW_FULL_PATH=false
  fi

  # Force a prompt reload to apply changes
  p10k reload
}
# Set up fzf key bindings and fuzzy completion
# source <(fzf --zsh)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Zoxide initialization script
eval "$(zoxide init zsh)"

# Compiler look up directories in homebrew library
export CPATH=/opt/homebrew/include/
export LIBRARY_PATH=/opt/homebrew/lib/

# Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
