### If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/opt/tcl-tk/bin:$PATH

### ZSH settings
export ZSH="${HOME}/.oh-my-zsh"
export XDG_CONFIG_HOME="${HOME}/.config"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Setting the terminal colors
export TERM="xterm-256color"

unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="cdimascio-lambda"

# Uncomment the following line to show "user@hostname" in the prompt.
DEFAULT_USER="uzubair"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
    alias vi='nvim'
fi

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
fi

# System specific settings
case `uname` in
    Darwin*)
        # MacOS specific settings
        LOCAL_DIRECTORY="/usr/local"

        # Plugins
        plugins=(
            git
            osx
            aws
            zsh-autosuggestions
            zsh-syntax-highlighting
            z
        )
    ;;
    Linux*)
        # Linux specific settings
        LOCAL_DIRECTORY="/home/linuxbrew/.linuxbrew"

        # Plugins
        plugins=(
            git
            aws
            z
        )
    ;;
esac

source $ZSH/oh-my-zsh.sh
source $LOCAL_DIRECTORY/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $LOCAL_DIRECTORY/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $LOCAL_DIRECTORY/share/zsh-history-substring-search/zsh-history-substring-search.zsh

[ -f $LOCAL_DIRECTORY/etc/profile.d/autojump.sh ] && . $LOCAL_DIRECTORY/etc/profile.d/autojump.sh

# Language envs
if which pyenv-init > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export PATH=$(pyenv root)/shims:$PATH
