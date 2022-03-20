<!-- insert
---
title: GoHugo Asciinema
description: "⏯️ Insert the Asciinema Player in your Hugo site with ease."
date: 2021-08-21T16:25:33
gometa: "cj.rs/gohugo-asciinema git https://github.com/cljoly/gohugo-asciinema"
tags:
- Hugo
- Asciinema
---
{{< github_badge >}}
end_insert -->
<!-- remove -->
# ⏯️ GoHugo Asciinema
<!-- end_remove -->

![Min Hugo Version: 0.77.0](https://img.shields.io/badge/min%20Hugo%20version-0.78.0-lightgrey?logo=hugo)

Insert the [Asciinema player](https://github.com/asciinema/asciinema-player) in your Hugo site with ease.

## Install

If you haven’t used hugo modules before (you need the go compiler):
```
hugo mod init <my-module-path>
```
more details in [hugo docs](https://gohugo.io/hugo-modules/use-modules/).

Then just:
```
hugo mod get -u -v cj.rs/gohugo-asciinema@3beta
```
and edit your hugo config, for instance for `config.toml`

``` toml
[module]
  [[module.imports]]
    path = "cj.rs/gohugo-asciinema"
```

### Going Back and Forth Between the Beta and the Default Version

To use the beta version, run:
```
hugo mod get -u -v cj.rs/gohugo-asciinema@3beta
```
and to go back to the default version
```
hugo mod get -u -v cj.rs/gohugo-asciinema
```
(we are simply using the [go *version query suffix*](https://go.dev/ref/mod#go-get) here)

## Use

Use this [shortcode](https://gohugo.io/content-management/shortcodes/):
<!-- remove -->
```md
{{< asciicast src="/telescope-repo-nvim/telescope.json" poster="npt:0:04" autoPlay=true loop=true >}}
```
<!-- end_remove -->
<!-- insert
```md
{{</* asciicast src="/telescope-repo-nvim/telescope.json" poster="npt:0:04" autoPlay=true loop=true */>}}
```
end_insert -->

### Notes

* `src` is the only required argument. All the other arguments are parameters in the object passed as the third argument of [`AsciinemaPlayer.create`](https://github.com/asciinema/asciinema-player#api).
* ⚠️  `src` is known to sometimes cause problem with relative URLs. Your best bet is to use absolute URLs or at least from the root of the site, as in the above example.
* Numbers and booleans should be passed **without** being enclosed in `"`, i.e. `autoPlay=true`, *not* `autoPlay="true"`.

## Features

* Displays a message when JavaScript is disabled in the user browser
* Fingerprinted assets, to improve caching and ultimately your site performance
* Update with `hugo mod get -u cj.rs/gohugo-asciinema`

## Contribute

You may use a local version of this module in hugo like this:

```toml
[module]
replacements = "cj.rs/gohugo-asciinema -> /some/path/gohugo-asciinema"
[[module.imports]]
path = "cj.rs/gohugo-asciinema"
```

Please consider sending a PR with your patches, it’s always appreciated and will save you the trouble of maintaining the changes on your own!
