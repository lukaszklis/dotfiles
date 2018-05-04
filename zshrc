# Uncomment the following line when debugging zsh’s performance
# zmodload zsh/zprof

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dracula"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM=$HOME/dev/personal/dotfiles/zsh-custom

plugins=(autojump brew common-aliases composer git httpie npm osx vagrant)

export PATH="/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/sbin"

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimconfig="vim ~/.vimrc"
alias tower="open -a Tower ."
alias png2jpg="mogrify -format jpg -background white -alpha remove -quality 85 *1x.png; mogrify -format jpg -background white -alpha remove -quality 35 *2x.png; find . -name '*.jpg' | imageoptim"
alias jpg2jpg="mogrify -format jpg -quality 85 *1x.jpg; mogrify -format jpg -quality 35 *2x.jpg; find . -name '*.jpg' | imageoptim"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi


source $ZSH_CUSTOM/aliases/yarn.zsh
source $ZSH_CUSTOM/functions/weather.zsh
source $ZSH_CUSTOM/functions/brew-cask-outdated.zsh

if [ -f $ZSH_CUSTOM/functions/exercism.zsh ]; then
  . $ZSH_CUSTOM/functions/exercism.zsh
fi

# Uncomment the following line when debugging zsh’s performance
# zprof
