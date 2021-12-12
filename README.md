# flameshot-tixte

A simple bash script inspired by [flameshot-s3-uploader](https://github.com/notmeta/flameshot-s3-uploader) but instead uploads to [tixte](https://tixte.com).

## Requirements

- Flameshot
- curl
- xclip
- jq

## Install

1. `git clone https://github.com/SyedAhkam/flameshot-tixte.git`

2. `cp flameshot-tixte.sh /usr/local/bin/flameshot-tixte`

## Usage

Pass in the Tixte upload key and domain name using environment variables.

```sh
TIXTE_AUTH_KEY="YOUR KEY" TIXTE_DOMAIN="your-domain.cool" flameshot-tixte
```

## i3-keybind

The following key bind works for me on i3.

```sh
bindsym --release $mod+Shift+s exec --no-startup-id TIXTE_AUTH_KEY="YOUR KEY" TIXTE_DOMAIN="your-domain.cool" flameshot-tixte
```
