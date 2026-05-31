# 📂 Panduan Struktur Direktori Dotfiles

Repository ini menggunakan struktur berbasis lokasi (mengikuti standar **XDG Base Directory**) agar file terorganisir dengan rapi dan mudah dibuat *symlink* (tautan) ke sistem Anda. 

Jika Anda ingin menambahkan file, script, atau konfigurasi aplikasi baru di masa depan, harap selalu mengikuti panduan penempatan berikut agar konsistensi tetap terjaga.

## 🗺️ Peta Direktori

```text
dotfiles/
├── .config/             # ➔ Target Symlink: ~/.config/
│   ├── alacritty/       # (Contoh: ~/.config/alacritty)
│   ├── bspwm/           # (Contoh: ~/.config/bspwm)
│   ├── nvim/            # (Contoh: ~/.config/nvim)
│   └── ...              # Tambahkan konfigurasi aplikasi modern lainnya di sini
│
├── .local/
│   ├── bin/             # ➔ Target Symlink: ~/.local/bin/
│   │                    # Tempatkan skrip bash/executable/otomasi kustom Anda di sini
│   │
│   └── share/           # ➔ Target Symlink: ~/.local/share/
│       ├── fonts/       # Aset font kustom (berupa .ttf, .otf, dll)
│       ├── themes/      # Aset tema UI (GTK/QT)
│       └── wallpapers/  # Kumpulan gambar wallpaper desktop
│
├── home/                # ➔ Target Symlink: ~/ (Home Directory)
│   ├── .tmux.conf       # (Contoh: ~/.tmux.conf)
│   ├── .zshrc           # (Contoh: ~/.zshrc)
│   └── ...              # File konfig klasik (dotfiles) diletakkan secara flat di sini
│
└── install.sh           # Skrip instalasi otomatis untuk menautkan seluruh struktur ini
```

## 🛠️ Aturan Penambahan Konfigurasi Baru

Untuk menjaga repository tetap bersih, ikuti 3 aturan emas berikut saat menambah konfigurasi baru:

1. **Konfigurasi Aplikasi Modern (`.config`)**
   Jika aplikasi Anda menyimpan *config* di dalam folder `~/.config/nama-app`, letakkan folder konfigurasi tersebut tepat di dalam `dotfiles/.config/nama-app/`.
   *Jangan meletakkannya secara acak di root repository.*

2. **File Dot Klasik (`home`)**
   Jika file *config* harus berada tepat di root home folder Anda (seperti `~/.gitconfig`, `~/.bashrc`, atau `~/.npmrc`), letakkan file tersebut di dalam folder `dotfiles/home/`.

3. **Skrip Executable Kustom (`bin`)**
   Simpan semua skrip CLI (seperti skrip screenshot, manajemen monitor, dll) di dalam direktori `dotfiles/.local/bin/`. Pastikan skrip sudah ditambahkan *permission* executable-nya (`chmod +x`).

## 🔄 Pembaruan Symlink

Skrip `install.sh` sudah diprogram secara cerdas untuk membaca direktori ini.
Setelah menambahkan file atau folder baru pada struktur di atas, Anda tidak perlu mengkonfigurasi ulang *script install*. Anda cukup menjalankan perintah di bawah ini dari terminal:

```bash
cd ~/dotfiles
./install.sh
```

Skrip tersebut akan melakukan _loop_ dan secara otomatis mendeteksi file baru lalu membuat *symlink* (`ln -sfn`) ke dalam sistem operasi tanpa merusak tautan yang sudah ada.
