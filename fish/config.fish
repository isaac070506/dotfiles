# you can choose anyone of below to add Homebrew to your path
# {{{
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

# if test -d /home/linuxbrew/.linuxbrew
#     /home/linuxbrew/.linuxbrew/bin/brew shellenv fish | source
# end

fish_add_path /home/linuxbrew/.linuxbrew/bin
fish_add_path /home/linuxbrew/.linuxbrew/sbin
# }}}

set -x EDITOR nvim
set -x VISUAL nvim

set -gx TMUX_CONFIG_DIR "$HOME/.config/tmux"

set -gx COLORTERM truecolor
set -gx TERM xterm-256color
set -gx CROSSTERM_FORCE_TRUE_COLOR 1


if status is-interactive
  # Commands to run in interactive sessions can go here

  # <shift><space> to accept-autosuggestion
  function fish_user_key_bindings
    # you shouldn't use the first option if “enable_kitty_keyboard = true” cause you any problems.
    # bind shift-space accept-autosuggestion
    bind \cy accept-autosuggestion
  end

  set -g theme_display_date no
  set -g fish_prompt_pwd_dir_length 0
  set -g theme_nerd_fonts yes
  set -g theme_newline_cursor yes
  set -g theme_newline_prompt " "
  # set -g theme_newline_prompt "><> "
  # set -g theme_color_scheme zenburn 
  set -g theme_color_scheme nord
  set -x VIRTUAL_ENV_DISABLE_PROMPT 1

  alias ls='eza --icons --group-directories-first --color=always'
  alias ok='okular'
  alias cl='clear'
  alias nv='openNvim'
  alias v='openNvim'
  alias act='source .venv/bin/activate.fish'
  alias venvCreate='python3 -m venv .venv'
  alias dact='deactivate'
  alias venvInstall='pip install --no-index --find-links=~/.py_packages/'
  alias gf='fcompile'
  alias py='python3'
  alias x='explorer.exe .'
  alias output="/home/isaac/Utilidades/codes/output.x $argv"
end

zoxide init fish | source

set -x GOROOT /usr/local/go
set -x GOPATH $HOME/go
fish_add_path $GOROOT/bin $GOPATH/bin

# if not set -q TMUX
#   exec tmux
# end

# set -x PKG_CONFIG_PATH (brew --prefix gtk+3)/lib/pkgconfig (brew --prefix gtk+3)/share/pkgconfig $PKG_CONFIG_PATH
