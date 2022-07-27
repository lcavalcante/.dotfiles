# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lcavalcante/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/anaconda3/etc/profile.d/conda.sh" ]; then
        . "${HOME}/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export EDITOR=nvim

#fzf
source $HOME/anaconda3/share/fzf/shell/key-bindings.zsh
source $HOME/anaconda3/share/fzf/shell/completion.zsh
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

#zk
export ZK_NOTEBOOK_DIR="${HOME}/repo/zk-notebooks"
alias zkei='zk edit --interactive'

#alias
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias lc='colorls'
alias nv='nvim'

#java stuff
export JAVA_HOME="${HOME}/.local/java/jdk-17.0.3.1"

#go stuff
export GOROOT="${HOME}/.local/go"
export GOPATH="${HOME}/repo/go"

export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.rbenv/bin:${JAVA_HOME}/bin:${HOME}/.vim/bundle/vim-iced/bin:${GOROOT}/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#ruby stuff
eval "$(rbenv init - zsh)"
