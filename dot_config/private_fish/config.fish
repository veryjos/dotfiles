set -U XTERM_VERSION 0
set -U fish_prompt_pwd_dir_length 0

set fish_color_command white

function checkout_next
  git log --reverse --pretty=%H master | grep -A 1 (git rev-parse HEAD) | tail -n1 | xargs git checkout
end

function checkout_prev
  git checkout HEAD^1
end

alias l=ls
alias vim=nvim
fish_vi_key_bindings

set PATH $PATH ~/.cargo/bin
set PATH $PATH ~/tools
