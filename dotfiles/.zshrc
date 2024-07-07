#zmodload zsh/zprof

source ~/.zplug/init.zsh

zplug "ohmyzsh/ohmyzsh", as:plugin, use:"plugins/wd", defer:2
zplug "ohmyzsh/ohmyzsh", as:plugin, use:"plugins/git", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
#zplug "ohmyzsh/ohmyzsh", as:plugin, use:"plugins/copypath", lazy:true
#zplug "lukechilds/zsh-nvm", defer:2, lazy:true
#zplug "zsh-users/zsh-syntax-highlighting", defer:2, lazy:true

if ! zplug check --verbose; then
    zplug install
fi

zplug load

export ZSH="$HOME/.oh-my-zsh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"

# nvm
export NVM_NODEJS_ORG_MIRROR=https://npmmirror.com/mirrors/node/
export NVM_DIR="$HOME/.nvm"
load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm() {
  unset -f nvm node npm npx
  load_nvm
  nvm "$@"
}
node() {
  unset -f nvm node npm npx
  load_nvm
  node "$@"
}
npm() {
  unset -f nvm node npm npx
  load_nvm
  npm "$@"
}
npx() {
  unset -f nvm node npm npx
  load_nvm
  npx "$@"
}

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

# homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# man
export MANPATH="/usr/local/man:$MANPATH"

# path env variable
path=(
  $path
  $HOME/bin:/usr/local/bin
  $PYENV_ROOT/bin
)

#export PATH="$HOME/Library/Java/JavaVirtualMachines/corretto-17.0.2/Contents/Home/bin:$PATH"
#PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH"
#PATH="/opt/homebrew/opt/php/bin:/opt/homebrew/opt/ruby/bin:$PATH"
#PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH"

# oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/.ys.omp.json)"
fi

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="%m/%d %H:%M"

#plugins=(
#  wd
#  git
#  copypath
#  zsh-autosuggestions
#  zsh-syntax-highlighting
#)

#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#fff"
#export TERM=xterm-256color

source $ZSH/oh-my-zsh.sh

# User configuration


# alias
alias ll="ls -alhS"
alias zshconfig="vim ~/.zshrc"
#alias ohmyzsh="vim ~/.oh-my-zsh"
#alias gstl="git stash list --pretty=format:'%C(yellow)%h %C(green)%cd %C(reset)%gs' --date=format:'%Y-%m-%d %H:%M:%S'"
#alias gslp='git stash list --pretty=format:"%C(red)%h%C(reset) - %C(dim yellow)(%C(bold magenta)%gd%C(dim yellow))%C(reset) %<(70,trunc)%s %C(green)(%cr) %C(bold blue)<%an>%C(reset)"'

#export GOROOT="/usr/local/go"
#export GOPATH="$HOME/go"
#PATH="$GOROOT/bin:$GOPATH:$PATH"

#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles
#export HOMEBREW_BREW_GIT_REMOTE=https://mirrors.ustc.edu.cn/brew.git

## python
#alias python="/Library/Frameworks/Python.framework/Versions/Current/bin/python3"
#export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/opt/python@3.10/lib"
#export PKG_CONFIG_PATH="/opt/homebrew/opt/python@3.10/lib/pkgconfig"

# network
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7890

## edit-command-line
export EDITOR=nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey -v

# alias
alias df='duf'
alias ls='exa'
alias vim='nvim'
alias bcopy='git branch --show-current | xargs echo -n | clipcopy && echo "copied"'
#alias ps='procs'
#alias yarn-list-link="( ls -l node_modules ; ls -l node_modules/@* ) | grep ^l"
#alias branch_copy='git branch --show-current | xargs echo -n | clipcopy && echo "copied"'

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Enable 1password CLI
#eval "$(op completion zsh)"; compdef _op op
#source $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#export pythonPath=/usr/bin/python
# export FZF_BASE=/opt/homebrew/bin/fzf
#unsetopt correct

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#setopt nocorrectall
#setopt no_nomatch

#lg () {
#    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
#
#    lazygit "$@"
#
#    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
#            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
#            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
#    fi
#}

#https://mirrors.aliyun.com/homebrew/homebrew-bottles

# Setting java env
#eval export PATH="$HOME/.jenv/shims:${PATH}"
#export JENV_SHELL=zsh
#export JENV_LOADED=1
#unset JAVA_HOME
#unset JDK_HOME
#source '/opt/homebrew/Cellar/jenv/0.5.6/libexec/libexec/../completions/jenv.zsh'
#jenv rehash 2>/dev/null
#jenv refresh-plugins
#jenv() {
#  type typeset &> /dev/null && typeset command
#  command="$1"
#  if [ "$#" -gt 0 ]; then
#    shift
#  fi
#
#  case "$command" in
#  enable-plugin|rehash|shell|shell-options)
#    eval `jenv "sh-$command" "$@"`;;
#  *)
#    command jenv "$command" "$@";;
#  esac
#}

#gbdel () {
#  gb | grep $1 | xargs git branch -D
#}
#zprof
