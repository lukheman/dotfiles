
check status battery

```fish
acpi -V
```

paru: hapus cache

```fish
paru -Scc
paru -Sc # hapus seluruh cache
```

pacman: sinkronisasi ulang
```fish
pacman -Syy
```

tar:

```fish
tar -xvzf nama_file.tar.gz
```

xrandr: penyesuaian layar external/proyektor/hdmi

```fish
xrandr --output HDMI-1 --auto --right-of eDP-1
# menampilakn layar hanya di proyektor
xrandr --output eDP-1 --off --output HDMI-1 --auto
```

du: mengetahui ukuran folder

```fish
du -sh folder
```
