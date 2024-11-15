#!/usr/bin/env fish

set -l fish_trace on

set df ~/.df

for d in $df/config/*
    for f in $d/*
        ln -sf $f ~/.config/(basename (dirname $f))
    end
end
