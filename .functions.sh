nix-search() {
  sudo nix search nixpkgs "$1" --json | jq -r '.[] | "\(.pname): \(.description)"'
}
lls() {
  ls -ah $1 | grep $2
}
hloc() {
  currentdir=$(pwd)
  if ! [ -d "/var/lib/hloc" ]; then
    sudo mkdir /var/lib/hloc >/dev/null
  fi
  case $1 in
  --update)
    sudo find "$(pwd)" -name ".git" -prune -o -name ".snapshots" -prune -o -name ".cargo" -prune -o -type d -print | grep -v -e "%" -e ".local/state/nvim" | sed -z 's/\n/%\n/g' | sudo tee /var/lib/hloc/"$USER".db >/dev/null
    sudo find "$(pwd)" -name ".cargo" -prune -o -name ".snapshots" -prune -o -name ".git" -prune -o -type f -print | grep -v -e "%" -e ".local/state/nvim" | sudo tee -a /var/lib/hloc/"$USER.db" >/dev/null
    ;;
  "") return ;;
  *)
    cd /var/lib/hloc
    case "$2" in
    "d" | "-d" | "dir" | "dirs") grep "$1" /var/lib/hloc/"$USER".db | grep -e "%" | tr -d '%' | java Main "$1" ;;
    "f" | "-f" | "file" | "files") grep "$1" /var/lib/hloc/"$USER".db | grep -v -e "%" | java Main "$1" ;;
    *) grep "$1" /var/lib/hloc/"$USER".db | java Main "$1" ;;
    esac
    cd $currentdir
    echo "\nyou can update the database via 'hloc --update'"
    ;;
  esac
}
nix-update() {
  sudo nix profile upgrade --all --refresh --impure
}
nix-add() {
  sudo nix profile add nixpkgs#"$1" --impure
}
sk() {
  sudo echo
  sudo -E nice -19 kitty &
}
jvc() {
  javac Main.java && java Main
}
