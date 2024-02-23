if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

fish_add_path /usr/local/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

abbr --add qq exit
abbr --add vim nvim
abbr --add pdf 'zathura --fork'
