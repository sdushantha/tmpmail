<h1 align="center">
  <img src="images/logo.png">
</h1>
<p align="center"> A temporary email right from your terminal</p><br>

<img src="images/demo.gif" align="right"> `tmpmail` tmpmail is a command line utility that allows you to create a temporary email address
and receive emails to the temporary email address. It uses 1secmail's [API](https://www.1secmail.com/api/)
to receive the emails.

By default `w3m` is used to render the HTML emails on the terminal.
But if you prefer another text based web browser or would rather view the email in a GUI web browser such as Firefox, simply
use the `--browser` argument followed by the command needed to launch the web browser of your choice.

<br>
<br>
<br>

## Dependencies
- `w3m`
- `curl`
- [`jq`](https://github.com/stedolan/jq)
- `awk`

## Installation
### Install locally

```bash
# Download the tmpmail file and make it executeable
$ curl -L "https://git.io/tmpmail" > tmpmail && chmod +x tmpmail

# Then move it somewhere in your $PATH. Here is an example:
$ mv tmpmail ~/bin/
```

### AUR
`tmpmail` is available on the [AUR](https://aur.archlinux.org/packages/tmpmail-git/), which is currently being maintained by [Benjamin Bädorf](https://github.com/b12f)

```bash
$ yay -S tmpmail-git
```

## Usage
```console
usage: tmpmail [-h] [--generate] [--text] [--browser BROWSER] [--recent] ID

optional arguments:
-h, --help           Show this help message
    --version        Print version
-g, --generate       Generate a new email address
-r, --recent         View the most recent email
-t, --text           View the email as raw text, where all the HTML tags are removed
-b, --browser        Change the browser that is used to render the HTML of the email (default: w3m)
```

### Examples
View the inbox
```console
$ tmpmail
[ Inbox for wdebivbyjor@1secmail.com ]

83414443   username@example.com   Test Email
```

View the email
```console
$ tmpmail 83414443
```

View the most recent email
```console
$ tmpmail -r
```

View emails as pure text
```console
$ tmpmail -t 83414443
To: wdebivbyjor@1secmail.com
From: username@example.com
Subject: Test Email

Hello World
```

## Credits 
This script is heavily inspired by Mitch Weaver's [`1secmail`](https://github.com/mitchweaver/bin/blob/master/application/1secmail) script
