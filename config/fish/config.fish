if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

fish_add_path /usr/local/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path /usr/local/smlnj/bin
fish_add_path ~/.nvim-macos-x86_64/bin

abbr --add qq exit
abbr --add vim nvim
