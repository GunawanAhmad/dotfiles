#Starship eval
eval "$(starship init zsh)"

#alias
alias ssh-setup="eval \`ssh-agent\` && ssh-add"

# shortcut for git
alias git-reset="git reset --hard HEAD"
alias ga="git add"
alias gpo="git push origin"
alias gcom="git commit"
alias gs="git status"
alias gc="git checkout"
alias gb="git branch"
alias gp="git push"
alias gpu="git pull"

#shortcut for pnpm
alias pd="pnpm dev"


function crun() {
  gcc $1 -o ${1%.c}.out && ./${1%.c}.out && rm ./${1%.c}.out
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
