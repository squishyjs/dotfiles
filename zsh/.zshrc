# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to Tmux configuration file
export TMUX_CONF="$HOME/.config/tmux/.tmux.conf"
if [ -n "$TMUX" ] && [ -f "$TMUX_CONF" ]; then
  tmux source-file "$TMUX_CONF"
fi

# zsh Theme Load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Auto update (frequency=13 days)
zstyle ':omz:update' frequency 13

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

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

# Git
alias all="git add ."
alias sendit="git push origin main"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gc="git commit -m"
alias gr="git remote"
alias gre="git reset"
alias add="git add"
alias gdiff="git diff"

# Alacritty
export TERM="alacritty"

# Neofetch
alias mac="neofetch"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /Users/john/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# CUSTOM MAPPINGS AND BINDINGS
# Map tab to accept autosuggestion
bindkey '^I' autosuggest-accept

# Toggle between full path and shortened directory name
function toggle_prompt_path() {
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
