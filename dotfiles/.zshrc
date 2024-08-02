# zmodload zsh/zprof

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PNPM_HOME:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PNPM_HOME="$HOME/Library/pnpm"
export XDG_CONFIG_HOME="$HOME/.config"
export MANPATH="/usr/local/man:$MANPATH"
export NVM_NODEJS_ORG_MIRROR=https://npmmirror.com/mirrors/node/
export YARN_DISTURL=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export PYTHON_BUILD_MIRROR_URL="https://pypi.tuna.tsinghua.edu.cn"
path=(
  $path
  $HOME/bin:/usr/local/bin
  $PYENV_ROOT/bin
  $HOME/.jenv/bin
  $NVM_BIN
)

plugins=(
  wd
  git
  zsh-autosuggestions
  nvm
  autojump
  command-not-found
)

zstyle ':omz:plugins:nvm' lazy autoload yes
#zstyle ':omz:plugins:nvm' autoload yes

ZSH_THEME=pmcgee

source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="%m/%d %H:%M"

# network
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7890

## edit-command-line
export EDITOR=nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -v

# alias
alias df='duf'
alias ls='exa'
alias ll="exa -la"
alias vim='nvim'
alias lg="lazygit"
alias config_zsh="vim ~/.zshrc"
alias config_proxy_conf="vim ~/.config/clash/n3.leensasf.us.yaml"
alias bcopy='git branch --show-current | xargs echo -n | clipcopy && echo "copied"'

# Lazyload pyenv
_pyenv_loaded=false
function _load_pyenv() {
  if [ "$_pyenv_loaded" = false ]; then
    eval "$($HOMEBREW_PREFIX/bin/pyenv init --path)"
    _pyenv_loaded=true
  fi
}
pyenv() {
  _load_pyenv
  command pyenv "$@"
}

# Lazyload jenv
# _jenv_loaded=false
# function _load_jenv() {
#   if [ "$_jenv_loaded" = false ]; then
#     eval "$($HOMEBREW_PREFIX/bin/jenv init -)"
#     _jenv_loaded=true
#   fi
# }
# jenv() {
#   _load_jenv
#   command jenv "$@"
# }

# zprof
