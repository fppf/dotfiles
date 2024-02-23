#!/usr/bin/env fish

sudo -v

set df ~/.df

for d in $df/config/*
	for f in $d/*
		ln -sf $f ~/.config/(basename (dirname $f))
	end
end

ln -sf $df/xinitrc ~/.xinitrc
ln -sf $df/scripts/wp.sh ~/.local/bin/wp
ln -sf $df/scripts/lock.sh ~/.local/bin/lock

sudo ln -sf $df/scripts/saver_feh /usr/local/libexec/xsecurelock/saver_feh
