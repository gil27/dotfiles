
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# MacPorts Installer addition on 2019-02-13_at_08:17:46: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH="/usr/local/opt/postgresql/bin:$PATH"


if [ -f ~/.git_alias ]; then
  . ~/.git_alias
fi

if [ -f ~/.bashrc  ]; then
  . ~/.bashrc
fi

if [ -f ~/.bioritmo_alias ]; then
  . ~/.bioritmo_alias
fi

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# display git branch
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

export PS1='\[\033[0;36m\]\w\[\033[00m\] $(parse_git_branch)\$ '

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# pg_ctl -D /usr/local/var/postgresql@9.6/ -l /usr/local/var/postgresql@9.6/server.log start
#export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/elasticsearch-2.4.0/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export ES_HOME="/usr/local/elasticsearch-2.4.0"
export PGHOST=localhost
export PATH="/usr/local/opt/node@10/bin:$PATH"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export LC_ALL=en_US.UTF-8
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
