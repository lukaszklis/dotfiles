# Uncomment the following line when debugging zsh’s performance
# zmodload zsh/zprof

export ZSH=$HOME/.oh-my-zsh
export LC_ALL=en_US.UTF-8

ZSH_THEME="minimal_improve"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM=$HOME/dev/personal/dotfiles/zsh-custom

plugins=(autojump common-aliases composer git npm osx vagrant zsh-autosuggestions zsh-syntax-highlighting)

export GOPATH="$HOME/dev/go"
export PATH="/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/sbin:$GOPATH/bin:/usr/local/opt/node@10/bin"

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# aliases
alias brew_cask_outdated="brew cask outdated --greedy"
alias update_submodules="git submodule update --recursive --remote"
alias git=hub
alias jpg2jpg="mogrify -format jpg -quality 85 *1x.jpg; mogrify -format jpg -quality 35 *2x.jpg; find . -name '*.jpg' | imageoptim"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias png2jpg="mogrify -format jpg -background white -alpha remove -quality 85 *1x.png; mogrify -format jpg -background white -alpha remove -quality 35 *2x.png; find . -name '*.jpg' | imageoptim"
alias vimconfig="vim ~/.vimrc"
alias zshconfig="vim ~/.zshrc"
alias cssconf-import="node scripts/spreadsheet-import 1BnWKMJCu3zszqRlhr5sxkgJ5mofHIjN15feDSADVwvA"
alias jsconf-import="node scripts/spreadsheet-import 1Dj6YjOQZe8KnOx29nsjGoRt-ZaHPjUEwU9cnuVVboPQ"
alias cl="clear"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# work-related functions
[ -f $ZSH_CUSTOM/functions/work.sh ] && source $ZSH_CUSTOM/functions/work.sh

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Uncomment the following line when debugging zsh’s performance
# zprof
