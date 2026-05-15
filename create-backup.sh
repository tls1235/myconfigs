mkdir backup
cp -r ~/.config backup/.config
cp ~/.zshrc backup/.zshrc
sudo cp /etc/pacman.conf backup/pacman.conf
cp -r ~/important backup/important
cp ~/.functions.sh backup/
# from here on this is creating the file to update the system
echo "sudo pacman -Syu --needed reflector
sudo reflector --latest 30 --protocol https --fastest 5 --sort rate --age 12 --save /etc/pacman.d/mirrorlist
sudo cp pacman.conf /etc/pacman.conf
sudo pacman -Syyu --needed $(pacman -Qq | tr '\n' ' ')
cp .config ~/.config
cp backup/.functions.sh ~/
cp .zshrc ~/.zshrc
cp -r important ~/important
cp .gitconfig ~/.gitconfig
chsh -s $(echo $SHELL)" >backup/zupdate-system.sh
