# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jose"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export ANDROID='/home/neto/adt-bundle-linux-x86_64/sdk'
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/neto/bin:/home/neto/grails-2.2.1/bin:$ANDROID/tools:$ANDROID/platform-tools

alias tado='cd /home/neto/prj/personal/tado/'
alias tadoo='cd /home/neto/prj/personal/tado/txt/organize'
alias tadob='cd /home/neto/prj/personal/tado/txt/brainstorm/'
alias tadom='cd /home/neto/prj/personal/tado/txt/meetings/'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias adb='$ANDROID/platform-tools/adb'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alert() {
    notify-send $@
}

export JAVA_HOME='/usr/lib/jvm/java-1.7.0-openjdk-amd64'
alias grails='/home/neto/grails-2.2.1/bin/grails'
export GROOVY_HOME='/usr/share/groovy'

bindkey -M vicmd '^R' history-incremental-search-backward
autoload -U edit-command-line
zle -N edit-command-line
zle-line-init() { zle -K vicmd; }
zle -N zle-line-init

list() { echo "\n"; ls; }
zle -N list
bindkey -M vicmd '^L' list

resumejob() { fg; }
zle -N resumejob
bindkey -M vicmd '^F' resumejob

. /usr/share/autojump/autojump.sh


android_trigger_remote() {
    read 'usern?username: '
    read -s 'pw?password: '

    curl -i -u "$usern:$pw" "https://ci.tado.com/job/PhonegapAndroid%20-%20Deploy/buildWithParameters?token=c191a406448d80e20b94e5302fe4e16922c9270c1cd43a98d32d7c9326d70428&HTML5APP_REMOTE=$1&HTML5APP_BRANCH=$2&ANDROID_REMOTE=$3&ANDROID_BRANCH=$4" --insecure;
}
ios_trigger_remote() {
    read 'usern?username: '
    read -s 'pw?password: '

    curl -i -u "$usern:$pw" "https://ci.tado.com/job/PhonegapIOS%20-%20Deploy/buildWithParameters?token=PhonegapIOSBuild&HTML5APP_REMOTE=$1&HTML5APP_BRANCH=$2&IOS_REMOTE=$3&IOS_BRANCH=$4&MANGLE=true" --insecure;
}
