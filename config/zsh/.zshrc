##### Setup
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH # Add zsh-completions
eval "$(/opt/homebrew/bin/brew shellenv)" # Add brew to PATH
PATH=`go env GOPATH`/bin/:$PATH # Add go tools to PATH
PATH="/opt/homebrew/opt/rustup/bin:$PATH" # Add rustup to PATH
PATH="/opt/homebrew/opt/libpq/bin:$PATH" # Add psql to PATH
# Setup fzf history plugin
source <(fzf --zsh)
FZF_CTRL_R_OPTS="--height 12 --layout reverse"
autoload -Uz compinit

##### Environment Vars
export VISUAL="nvim"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export GIT_EDITOR="nvim"
export PATH="$HOME/dotfiles/scripts:$PATH"
# https://bitwarden.com/help/ssh-agent/#tab-macos-6VN1DmoAVFvm7ZWD95curS
export SSH_AUTH_SOCK="$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"

##### Aliases
alias python="python3"
alias RV="R --vanilla --quiet"
alias grep="grep --color=auto"
alias ls="gls --color --group-directories-first"
alias l="gls -Flh --color --group-directories-first"
alias ll="gls -Flha --color --group-directories-first"
pbcopy-folder() {
  local target_dir="${1:-.}"
  # You can also pass patterns as second argument. For example *.md or *.js
  # Default to '*' (all files) if no pattern is provided
  local name_pattern="${2:-*}"
  if [ ! -d "$target_dir" ]; then
    echo "Error: '$target_dir' is not a valid directory." >&2
    return 1
  fi
  find "$target_dir" -type f -name "$name_pattern" -exec cat {} + | pbcopy
}
# Bind tmux sessionizer
bindkey -s ^F "tmux-sessionizer\n"

##### Setup tab completion (https://thevaluable.dev/zsh-completion-guide-examples/)
zstyle ":completion:*" menu select
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" complete-options true
zstyle ":completion:*" completer _extensions _complete _approximate
# default bsd/gls colors
zstyle ":completion:*" list-colors \
  "di=1;34" "ln=1;35" "so=1;31" "pi=1;33" "ex=1;32" "bd=1;34;46" \
  "cd=34;43" "su=30;41" "sg=30;46" "tw=30;42" "ow=30;43"
zstyle ":completion:*" list-grouped true # list directories first
zstyle ":completion:*:warnings" format " %B%F{red}-- no matches found --%f%b"
zmodload zsh/complist
_comp_options+=(globdots) # Include hidden files.

##### Prefix based completion (https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

##### History
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.config/zsh/.zsh_history
setopt appendhistory
setopt share_history
setopt inc_append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

##### Change prompt (https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/robbyrussell.zsh-theme)
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ":vcs_info:git:*" formats "%F{blue}%Bgit:(%F{red}%b%F{blue})%%b%f "
PROMPT="%B%(?:%F{green}➜%f:%F{red}➜%f) %F{cyan}%c%b%f"
PROMPT+=' ${vcs_info_msg_0_}'
##### change cursor to non blinking pipe
echo -ne '\e[6 q'
compinit
