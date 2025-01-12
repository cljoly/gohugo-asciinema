#!/bin/env fish

set -l aversion $argv[1]

if test -z $aversion
    set aversion (gh release list -R asciinema/asciinema-player | fzf | awk '{print $1}')
    echo $aversion
end

echo $aversion
if test -z $aversion
    echo "No version specified"
    exit 1
end

wget -O assets/js/asciinema-player.min.js https://github.com/asciinema/asciinema-player/releases/download/v$aversion/asciinema-player.min.js
wget -O assets/css/asciinema-player.css https://github.com/asciinema/asciinema-player/releases/download/v$aversion/asciinema-player.css

git cr "Update to $aversion, downloaded from the release page"
git tag -s v$aversion -m "Version $aversion"

git show v$aversion
