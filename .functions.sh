nix-search() {
  nix search nixpkgs "$1" --json | jq -r '.[] | "\(.pname): \(.description)"'
}
lls() {
  ls -ah $1 | grep $2
}
hloc() {
  updatedb=0
  currentdir=$(pwd)
  case $1 in
  --update) find $(pwd) >~/Documents/.homedb ;;
  "") return ;;
  *)
    cd ~/javaprojects/hloc
    if ! java Main "$(grep -i "$(echo "$1" | sed 's/\./\\./g')" ~/Documents/.homedb)" $1; then
      read -r "updatedb?the file either doesnt exist or the database isnt updated, would you like to update it? (N/y)"
      if [[ $updatedb == y || $updatedb == Y ]]; then
        cd $currentdir
        find "$(pwd)" >~/Documents/.homedb
      else
        cd $currentdir
        echo "\nthe database may also be updated via running 'hloc --update'"
      fi
    fi
    ;;
  esac
  cd $currentdir
}
nix-update() {
  nix profile upgrade --all --refresh --impure
}
nix-add() {
  nix profile add nixpkgs#"$1" --impure
}
hytale() {
  #!/bin/bash
  PLACEHOLDER=($(echo "$1" | tr ',' '\ '))
  WORLDSFIX=()
  WORLDSSAVE=()
  if ! [ $1 = all ]; then
    for f in "${PLACEHOLDER[@]}"; do
      WORLDSSAVE+=(~/.var/app/com.hypixel.HytaleLauncher/data/Hytale/UserData/Saves/"$f")
      WORLDSFIX+=(~/important/hytale-backups/backup-LATEST/"$f")
    done
  else
    WORLDSSAVE+=(~/.var/app/com.hypixel.HytaleLauncher/data/Hytale/UserData/Saves/*)
    WORLDSFIX+=(~/important/hytale-backups/backup-LATEST/*)

  fi
  if [ $2 = fix ]; then
    cp -r "${WORLDSFIX[@]}" ~/.var/app/com.hypixel.HytaleLauncher/data/Hytale/UserData/Saves/
  elif [ $1 = save ]; then
    cp -r ~/.var/app/com.hypixel.HytaleLauncher/data/Hytale/UserData/Saves/* ~/important/hytale-backups/backup-OUTDATED/
    mv ~/important/hytale-backups/backup-OUTDATED ~/important/hytale-backups/placeholder
    mv ~/important/hytale-backups/backup-LATEST ~/important/hytale-backups/backup-OUTDATED
    mv ~/important/hytale-backups/placeholder ~/important/hytale-backups/backup-LATEST
    exit
  elif [ $1 = fix ]; then
    cp -r ~/important/hytale-backups/backup-LATEST/* ~/.var/app/com.hypixel.HytaleLauncher/data/Hytale/UserData/Saves/
    exit
  elif [[ $1 = "" ]]; then
    flatpak run com.hypixel.HytaleLauncher &
    disown
    exit
  fi
  pkill gslapper
  flatpak run com.hypixel.HytaleLauncher &
  disown
  sleep 300
  while true; do
    time=0
    cp -r "${WORLDSSAVE[@]}" ~/important/hytale-backups/backup-OUTDATED/
    mv ~/important/hytale-backups/backup-OUTDATED ~/important/hytale-backups/placeholder
    mv ~/important/hytale-backups/backup-LATEST ~/important/hytale-backups/backup-OUTDATED
    mv ~/important/hytale-backups/placeholder ~/important/hytale-backups/backup-LATEST
    until [ "$time" -eq "30" ]; do
      sleep 10
      if ! pkill -0 HytaleClient; then
        cp -r "${WORLDSSAVE[@]}" ~/important/hytale-backups/backup-OUTDATED/
        mv ~/important/hytale-backups/backup-OUTDATED ~/important/hytale-backups/placeholder
        mv ~/important/hytale-backups/backup-LATEST ~/important/hytale-backups/backup-OUTDATED
        mv ~/important/hytale-backups/placeholder ~/important/hytale-backups/backup-LATEST
        exit
      else
        ((time += 1))
      fi
    done
  done
}
