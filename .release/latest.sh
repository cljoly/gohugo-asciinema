#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./latest.sh Commit the latest version of the player

Create a tag as well

'
    exit
fi
cd "$(dirname "$0")"

tag="$(gh -R asciinema/asciinema-player release view --json tagName -t "{{.tagName}}")"

gh -R asciinema/asciinema-player release view "$tag"

gh -R asciinema/asciinema-player release download "$tag" --pattern 'asciinema-player.css' --clobber -O ../assets/css/asciinema-player.css
gh -R asciinema/asciinema-player release download "$tag" --pattern 'asciinema-player.min.js' --clobber -O ../assets/js/asciinema-player.min.js

gh -R asciinema/asciinema-player release view "$tag" --json tagName,body -t "Update to {{.tagName}}, downloaded from Release page

# Asciinema release notes
{{.body}}" | git commit -a -F -

gh -R asciinema/asciinema-player release view "$tag" --json tagName,body -t "Version {{.tagName}} of the Asciinema player

# Asciinema release notes
{{.body}}" | git tag -a "$tag" -F -

echo
echo "Tag and commit created, now test and create a pull request"
