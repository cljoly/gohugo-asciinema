<!-- insert
---
title: GoHugo Asciinema
description: "⏯️ Insert the Asciinema Player in your Hugo site with ease."
date: 2021-08-21T16:25:33
gometa: "cj.rs/gohugo-asciinema git https://github.com/cljoly/gohugo-asciinema"
tags:
- Hugo
- Asciinema
- Performance
---
{{< github_badge >}}

{{< rawhtml >}}
<div class="badges">
{{< /rawhtml >}}
end_insert -->
<!-- remove -->
# ⏯️ GoHugo Asciinema
<!-- end_remove -->

![Min Hugo Version: 0.77.0](https://img.shields.io/badge/min%20Hugo%20version-0.78.0-lightgrey?logo=hugo)
[![RSS feed of new versions](https://img.shields.io/badge/subscribe-with%20RSS-FFA500?logo=rss)](https://github.com/cljoly/gohugo-asciinema/releases.atom)
[![Asciinema Player Version](https://img.shields.io/github/v/tag/cljoly/gohugo-asciinema?label=asciinema%20player%20version&logo=asciinema)](https://github.com/cljoly/gohugo-asciinema/tags/)
[![Powered by RISS (cj.rs/riss)](https://img.shields.io/badge/powered%20by-riss-lightgrey)](https://cj.rs/riss)

<!-- insert
{{< rawhtml >}}
</div>
{{< /rawhtml >}}
end_insert -->

Want to insert a short demo of your tool or of a command execution on your website?
You could insert a video, but then visitors can’t copy text, and it’ll make your page quite heavy.
The [Asciinema player](https://github.com/asciinema/asciinema-player) solves all of that, by replaying a terminal session stored in a text file.

This Hugo module makes it very easy to use the Asciinema Player on your Hugo-powered static website.

## Install

### Hugo Module

1. Make sure the [go compiler](https://go.dev) is installed as well as [Hugo](https://gohugo.io).
   To check that, run the commands below. If the programs are installed, they should not return an error. Otherwise, see the [go install instructions](https://go.dev/doc/install) and [Hugo install instructions](https://gohugo.io/getting-started/quick-start/):
   ```
   go version
   ```
   ```
   hugo version
   ```

2. If you haven’t already, you need to initialize Hugo modules:
    ```
    hugo mod init example.com/my-awesome-website
    ```
    This needs to be done once per Hugo site.
    Read the [Hugo documentation](https://gohugo.io/hugo-modules/use-modules/) for details and background.

### Install This Module

Once Hugo modules are set up (see the [previous section](#hugo-module)), you can install the asciinema module itself.

1.  Run:
    ```
    hugo mod get -u -v cj.rs/gohugo-asciinema
    ```

2.  Edit your Hugo config to add the module reference.

    For instance, if you use a `config.toml` config file, add:
    ``` toml
    [module]
    [[module.imports]]
    path = "cj.rs/gohugo-asciinema"
    ```

    For `config.yml`, add:
    ``` yaml
    module:
    imports:
        - path: cj.rs/gohugo-asciinema
    ```

## Use

Use this [shortcode][]:
<!-- remove -->
```md
{{< asciicast src="/telescope-repo-nvim/telescope.json" poster="npt:0:04" autoPlay=true loop=true >}}
```

[This is how it’ll be rendered on your website][example_use].
<!-- end_remove -->
<!-- insert
```md
{{</* asciicast src="/blog/cargo-info-in-neovim/demo.json" poster="npt:0:04" autoPlay=true loop=true */>}}
```

It's rendered like this:
{{< asciicast src="/blog/cargo-info-in-neovim/demo.json" poster="npt:0:04" autoPlay=true loop=true >}}
end_insert -->

### Defaults

You can set default values for the player in your `config.toml` or `params.toml` etc.. For example:

#### `config.toml`

```toml
[params.asciinema.defaults]
theme = "solarized-dark"
loop = true
autoPlay = true
speed = 5.0
```

#### `params.toml`

```toml
[asciinema.defaults]
theme = "solarized-dark"
loop = true
autoPlay = true
speed = 5.0
```

### Notes

> [!NOTE]
> `src` is the only required argument. All the other arguments are parameters in the object passed as the third argument of [`AsciinemaPlayer.create`](https://docs.asciinema.org/manual/player/quick-start/#basic-usage).

> [!WARNING]
> `src` is known to sometimes cause problem with relative URLs. Your best bet is to use absolute URLs or at least from the root of the site, as in the above example.

> [!IMPORTANT]
> Numbers and booleans should be passed **without** being enclosed in `"`, i.e. `autoPlay=true`, *not* `autoPlay="true"`.

### Advanced Features

#### Preloading

If you want to instruct the browser to [preload](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rel/preload) the CSS and JS of the Asciinema Player, only when the page contains an asciicast, you can add the following line in the `<head>` tag of your template:

```
{{- partial "asciinema_css_js_smart_preload" . -}}
```

Themes often offer ways to do this easily.
For instance with [Hugo PaperMod][PaperMod], it’s in [this file][extended_header].

This partial will also cause [some services](https://developers.cloudflare.com/pages/configuration/early-hints/) to send [Early Hints](https://developers.cloudflare.com/pages/platform/early-hints/).
That can further improve the page load time.

## Features

* Displays a message when JavaScript is disabled in the user browser
* Fingerprinted assets, to improve caching and ultimately your site performance
* Optional [preloading](#preloading) of JS and CSS assets
* Easy update with `hugo mod get -u cj.rs/gohugo-asciinema`

## How Are the Sources of the Player Generated?

The Asciinema Player version is fetched from the official repository in the corresponding version.
Then, if prebuilt JS/CSS files are provided they are used, so that you can verify that this module is actually distributing the original code.
If not, these files are generated following the instructions from Asciinema Player Readme.

## Contribute

Contributions (documentation or code improvements in particular) are welcome, see [contributing](https://cj.rs/docs/contribute/)!

To test your code changes locally, you can change your configuration so that your local version is loaded.
Here is an example in TOML:

```toml
[module]
replacements = "cj.rs/gohugo-asciinema -> /some/path/gohugo-asciinema"
[[module.imports]]
path = "cj.rs/gohugo-asciinema"
```

Please consider sending a PR with your patches, it’s always appreciated and will save you the trouble of maintaining the changes on your own!

### License

The code of this module (everything but the folder `assets`) is under the [Apache License 2.0][apache2], like the asciinema player itself.

The `assets` folder contains the asciinema player. This code is Copyright Marcin Kulik, licensed under the [Apache License, Version 2.0][apache2]. See the [upstream repository][player] for the full sources.

[example_use]: https://cj.rs/gohugo-asciinema/#use
[apache2]: https://www.apache.org/licenses/LICENSE-2.0
[player]: https://github.com/asciinema/asciinema-player
[extended_header]: https://github.com/adityatelange/hugo-PaperMod/blob/b5f7118d826e663bfe76f56eba2baa028a384325/layouts/partials/extend_head.html
[PaperMod]: https://github.com/adityatelange/hugo-PaperMod/
[shortcode]: https://gohugo.io/content-management/shortcodes/
