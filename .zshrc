# export PATH=$HOME/bin:/usr/local/bin:$PATH

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export GRADLE_HOME="/Users/micha/install/gradle/gradle-5.0"

export PATH="$GRADLE_HOME/bin:$PATH"
#export PATH="/Users/micha/install/gnat2016/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Users/micha/install/leinigen"

# Path to your oh-my-zsh installation.
export ZSH=/Users/micha/.oh-my-zsh

export LC_ALL=en_US.UTF-8

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="micha-frisk"
#ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx vi-mode)

source $ZSH/oh-my-zsh.sh

#################################################################################
# User configuration
#

# edit command line in editor by hitting CTRL X E
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'
# faster mode switch for vi: KEYTIMEOUT is in hundredths of a second
#   https://www.johnhawthorn.com/2012/09/vi-escape-delays/
export KEYTIMEOUT=1

#bindkey -v '^?' backward-delete-char
# Fix delete key: https://superuser.com/questions/983016/zsh-delete-keybinding
bindkey "\e[3~" delete-char

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias nvim-essential="nvim -u ~/.config/nvim/essential.vimrc"


#
#
#
unsetopt share_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# kubectl auto completion: https://stackoverflow.com/a/48202907
kubectl () {
    command kubectl $*
    if [[ -z $KUBECTL_COMPLETE ]]
    then
        source <(command kubectl completion zsh)
        KUBECTL_COMPLETE=1
    fi
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

PATH="/Users/micha/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/micha/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/micha/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/micha/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/micha/perl5"; export PERL_MM_OPT;

###
# Alacritty terminal
export PATH="$PATH:/Applications/Alacritty.app/Contents/MacOS/"

if [ -f "/Users/micha/.config/alacritty/alacritty_theme_switcher.sh" ]; then
    . "/Users/micha/.config/alacritty/alacritty_theme_switcher.sh"
fi

# >>> conda initialize >>>
#
# NOTE FROM micha: Special setup to solve zshr/tmux issue
#   tmux runs login shells so the init script parsing is
#   wierd. This solution is based on:
#
#   https://github.com/conda/conda/issues/6826#issuecomment-397287212
#
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/micha/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
#     echo "---------"
# else
    if [ -f "/Users/micha/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/micha/miniconda3/etc/profile.d/conda.sh"

        # special handling for TMUX
        [[ -z $TMUX ]] || conda deactivate; conda activate base

        # special handling for vscode
        if [[ ${TERM_PROGRAM} && $TERM_PROGRAM = "vscode" ]]; then
            conda deactivate && conda activate base
        fi
    else
        export PATH="/Users/micha/miniconda3/bin:$PATH"
    fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

