# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"

# Uncomment the following line when debugging zsh’s performance
# zmodload zsh/zprof

ZSH_DISABLE_COMPFIX="true"

export ZSH=$HOME/.oh-my-zsh
export LC_ALL=en_US.UTF-8

ZSH_THEME="minimal"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_MAGIC_FUNCTIONS="true"
ZSH_CUSTOM=$HOME/dev/personal/dotfiles/zsh-custom

fpath=($HOME/.asdf/completions $fpath)
plugins=(asdf autojump common-aliases composer git npm macos sublime-merge vagrant zsh-autosuggestions zsh-syntax-highlighting)

export GOPATH="$HOME/dev/go"
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/sbin:$GOPATH/bin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/usr/local/opt/bzip2/bin"
export PATH="$PATH:$HOME/.pyenv/shims"

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# aliases
alias update_submodules="git submodule update --recursive --remote"
alias jpg2jpg="mogrify -format jpg -quality 85 *1x.jpg; mogrify -format jpg -quality 35 *2x.jpg; find . -name '*.jpg' | imageoptim"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias png2jpg="mogrify -format jpg -background white -alpha remove -quality 85 *1x.png; mogrify -format jpg -background white -alpha remove -quality 35 *2x.png; find . -name '*.jpg' | imageoptim"
alias vimconfig="vim ~/.vimrc"
alias zshconfig="vim ~/.zshrc"
alias cl="clear"

if which pyenv > /dev/null; then
  eval "$(pyenv init --path)";
  eval "$(pyenv init -)";
fi

# work-related functions
[ -f $ZSH_CUSTOM/functions/work.sh ] && source $ZSH_CUSTOM/functions/work.sh

# Uncomment the following line when debugging zsh’s performance
# zprof

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
