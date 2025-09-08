# Attach tmux if not already attached
if [ -z "$TMUX" ]; then
  tmux attach || tmux new-session
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


#NVIM alias
alias n="nvim"

alias lg="lazygit"
alias ld="lazydocker"

# add go to env var
export PATH=$PATH:/usr/local/go/bin

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$(go env GOPATH)/bin

# add emacs doom to path
export PATH=$PATH:$HOME/.config/emacs/bin

export PATH=$PATH:$HOME/dotfiles/script/script

#Starship eval
eval "$(starship init zsh)"

#alias
alias ssh-setup="eval \`ssh-agent\` && ssh-add"
alias n="nvim"

#shortcut for pnpm
alias pd="pnpm dev"

function crun() {
  gcc $1 -o ${1%.c}.out && ./${1%.c}.out && rm ./${1%.c}.out
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/guns/.bun/_bun" ] && source "/home/guns/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(zoxide init zsh)"

# alias cd="z"


export XDG_DESKTOP_PORTAL_IMPLEMENTATION=xdg-desktop-portal-wlr
