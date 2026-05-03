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
  --update) sudo find "$(pwd)" -name ".git" -prune -o -name ".snapshots" -prune -o -name ".cargo" -prune -o -print | grep -v -e "%" | sudo tee /var/lib/hloc/"$USER".db >/dev/null ;;
  "") return ;;
  *)
    cd ~/javaprojects/hloc
    input="$(grep "$1" /var/lib/hloc/"$USER".db)"
    echo "$input" | java Main "$1"
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
