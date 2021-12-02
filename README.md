[ list manual apt packages]: comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

[ sym link command ]: ln -S ~/.dotfiles/[FILE] ~/[FILELNK]
