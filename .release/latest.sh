#!/usr/bin/env bash

# SPDX-License-Identifier: Apache-2.0
# Copyright Clément Joly and contributors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


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
