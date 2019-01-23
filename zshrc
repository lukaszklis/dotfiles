# Uncomment the following line when debugging zsh’s performance
# zmodload zsh/zprof

export ZSH=$HOME/.oh-my-zsh
export LC_ALL=en_US.UTF-8

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM=$HOME/dev/personal/dotfiles/zsh-custom

plugins=(autojump common-aliases composer git npm osx vagrant zsh-autosuggestions)

export GOPATH="/Users/lukaszklis/dev/go"
export PATH="/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/sbin:$GOPATH/bin"

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

alias run_headless_chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 --headless"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

source $ZSH_CUSTOM/aliases/core.zsh
source $ZSH_CUSTOM/aliases/images.zsh

source $ZSH_CUSTOM/functions/weather.zsh
source $ZSH_CUSTOM/functions/brew-cask-outdated.zsh

if [ -f $ZSH_CUSTOM/functions/work.zsh ]; then
  . $ZSH_CUSTOM/functions/work.zsh
fi

# added by travis gem
[ -f /Users/lukaszklis/.travis/travis.sh ] && source /Users/lukaszklis/.travis/travis.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/lukaszklis/.sdkman"
[[ -s "/Users/lukaszklis/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/lukaszklis/.sdkman/bin/sdkman-init.sh"

# Uncomment the following line when debugging zsh’s performance
# zprof
