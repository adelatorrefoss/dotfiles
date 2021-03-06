# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/home/antonio/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gl='git log'
alias gs='git status'
alias gd='git diff -w'
alias gdt='git difftool -y'

alias ga='git add'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gcl='git clone'
alias grom='git rebase origin/master'
alias grod='git rebase origin/develop'

export GRAILS_OPTS="-Xmx3000M -Xms1024M -server -XX:PermSize=512m -XX:MaxPermSize=512m"

# unset gnome keyring to avoid warning errors
unset GNOME_KEYRING_CONTROL

# android
#export PATH=${PATH}:/opt/android/adt-bundle-linux/sdk/platform-tools/:/opt/android/adt-bundle-linux/sdk/tools/

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

# z
. /home/antonio/bin/dotfiles/z/z.sh

#java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64


export NVM_DIR="/home/antonio/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# virtualenvwrapper activation
#source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
export PROJECT_HOME=/home/antonio/source/

alias docker-remove-all-containers="docker ps -aq | xargs docker stop && docker ps -aq | xargs docker rm"

export PATH="$HOME/.cask/bin:$PATH"

# SETS-project
if [ -f ~/strong-oracle.rc ]; then
    source ~/strong-oracle.rc
fi
# END SETS-project

export PATH="/home/antonio/Android/Sdk/platform-tools:/home/antonio/Android/Sdk/tools:$PATH"

export ANDROID_HOME=/home/antonio/Android/Sdk

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/antonio/.sdkman"
[[ -s "/home/antonio/.sdkman/bin/sdkman-init.sh" ]] && source "/home/antonio/.sdkman/bin/sdkman-init.sh"
