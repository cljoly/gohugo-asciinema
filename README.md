<!-- insert
---
title: GoHugo Asciinema
date: 2021-08-21T16:25:33
gometa: "cj.rs/gohugo-asciinema git https://github.com/cljoly/gohugo-asciinema"
---
end_insert -->
<!-- remove -->
# GoHugo Asciinema
<!-- end_remove -->

Insert the [Asciinema Player](https://github.com/asciinema/asciinema-player) in your hugo site with ease.

## Install

If you haven’t used hugo modules before (you need the go compiler):
```
hugo mod init <my-module-path>
```
more details in [hugo docs](https://gohugo.io/hugo-modules/use-modules/).

Then just:
```
hugo mod get -u -v cj.rs/gohugo-asciinema
```
and edit your hugo config, for instance for `config.toml`

``` toml
[module]
  [[module.imports]]
    path = "cj.rs/gohugo-asciinema"
```

## Use

Use this [shortcode](https://gohugo.io/content-management/shortcodes/):
```md
{{< asciicast src="./telescope.cast" poster="npt:0:04" autoplay="true" >}}
```

## Features

* Displays a message when JavaScript is disabled in the user browser
* Fingerprinted assets, to improve caching and ultimately your site performance **TODO**
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
