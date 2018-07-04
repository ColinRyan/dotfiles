packages=('gcc' 'vim' 'neovim' 'networkmanager' 'git' 'termite' 'wget' 'curl' 'tmux' 'i7-wm' 'i3status' 'i3blocks' 'sudo' 'xorg-server' 'openssh' 'xorg-xinit' 'python3' 'adobe-source-code-pro-font' 'binutils' 'make' 'fakeroot' 'dmenu' 'universal-ctags' 'php' 'composer' 'nodejs' 'xclip' 'mysql-workbench' 'pulseaudio' 'alsa-mixer' 'virtualbox' 'vagrant' 'docker' 'fzf' 'ripgrep' 'autojump' 'dunst' 'npm' 'python-pip' 'unzip' 'zip' 'rofi' 'surfraw' 'automake' 'pkg-config' 'autoconf' 'irssi')

ypackages=('php-msgpack' 'alacritty')

pippackages=('awscli' 'aws-shell' 'awsebcli')


sudo pacman-key --refresh-keys
for i in "${packages[@]}"
do
	echo $1
	yes | sudo pacman -S $i
done

sudo systemctl enable NetworkManager

git init .
git remote add -t \* -f origin git@github.com:ColinRyan/dotfiles.git
git checkout master

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir code
mkdir idea

cd code
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..


composer global require 'laravel/installer'
git config --global user.name "Colin Ryan"
git config --global user.email 'c.ryan@mun.ca'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

