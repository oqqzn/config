# ~/.bashrc: executed by bash(1) for non-login shells.

# Load sensitive environment variables
[ -f ~/.env ] && source ~/.env

case $- in
    *i*) ;;
    *) return;;
esac

# History settings
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=25000
HISTFILESIZE=25000
shopt -s checkwinsize

# Enable color support for common commands
if command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls -G'  # macOS alternative
fi


# Git prompt support
if [ -f "/opt/homebrew/etc/bash_completion.d/git-prompt.sh" ]; then
    source "/opt/homebrew/etc/bash_completion.d/git-prompt.sh"
fi

# Git prompt settings (important fix)
export GIT_PS1_SHOWCOLORHINTS=0
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_DESCRIBE_STYLE="branch"

prompt_cmd() {
    # window title (safe to print here)
    printf '\033]0;%s\007' "main"

    # --- virtual-env ---
    local venv_part=""
    if [[ -n $VIRTUAL_ENV ]]; then
        local venv_base=${VIRTUAL_ENV##*/}
        local venv_dir=${VIRTUAL_ENV%/*}
        if [[ $venv_dir == $PWD ]]; then
            venv_part="(\[\e[1;32m\]$venv_base\[\e[0m\])"
        else
            venv_part="(\[\e[1;32m\]${venv_dir##*/}/$venv_base\[\e[0m\])"
        fi
    fi

    # --- git (NO internal git colors; we color the wrapper only) ---
    local git_part
    git_part=$(__git_ps1 '(\[\e[1;34m\]%s\[\e[0m\])')

    # two-line prompt: info line, then input line
    PS1="${venv_part}${git_part} \[\e[35m\]\W\[\e[0m\]\n\[\e[1;36m\]→ \[\e[0m\] "
}
PROMPT_COMMAND=prompt_cmd

# → (.venv)(main) directory
# PS1="\[\e[1;36m\]→ \[\e[0m\]${venv_part}${git_part} \[\e[35m\]\W\[\e[0m\] "

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Custom alias directories
alias doc='cd ~/Documents/'
alias docs='cd ~/Documents/'
alias documents='cd ~/Documents/'
alias download='cd ~/Downloads/'
alias downloads='cd ~/Downloads/'
alias down='cd ~/Downloads/'
alias cloud='cd ~/iCloud/'
alias proton='cd ~/ProtonDrive/'
alias drive='cd ~/OneDrive/'
alias vault='cd ~/Documents/master-00/'
alias work='cd ~/workspace/'
alias epa='cd ~/workspace/epworth-automation/'
alias spanner='cd ~/workspace/epworth-automation/erp/spanner-with-database/spanner'
alias usdlf='cd ~/workspace/usdlf/'
alias config='cd ~/config'
alias claude="$HOME/.local/bin/claude"


# Custom alias utilities
alias v='nvim'
alias bashrc='v ~/config/.bashrc'
alias pyhtml="python3 -m http.server 8000"
alias reload='source ~/config/.bashrc'

# Set default editor
export EDITOR=nvim

# Silence Bash warning on Mac
export BASH_SILENCE_DEPRECATION_WARNING=1

export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
