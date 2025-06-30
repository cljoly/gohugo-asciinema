#!/bin/env fish

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
