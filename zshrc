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
export PATH="/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/sbin:$GOPATH/bin:/usr/local/opt/node@10/bin"

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# aliases
alias brew_cask_outdated="brew cask outdated --greedy"
alias git=hub
alias jpg2jpg="mogrify -format jpg -quality 85 *1x.jpg; mogrify -format jpg -quality 35 *2x.jpg; find . -name '*.jpg' | imageoptim"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias png2jpg="mogrify -format jpg -background white -alpha remove -quality 85 *1x.png; mogrify -format jpg -background white -alpha remove -quality 35 *2x.png; find . -name '*.jpg' | imageoptim"
alias run_headless_chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 --headless"
alias vimconfig="vim ~/.vimrc"
alias zshconfig="vim ~/.zshrc"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# travis gem
[ -f /Users/lukaszklis/.travis/travis.sh ] && source /Users/lukaszklis/.travis/travis.sh

# sdkman
export SDKMAN_DIR="/Users/lukaszklis/.sdkman"
[[ -s "/Users/lukaszklis/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/lukaszklis/.sdkman/bin/sdkman-init.sh"

# Uncomment the following line when debugging zsh’s performance
# zprof
