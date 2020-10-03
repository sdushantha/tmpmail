<h1 align="center">
  <img src="images/logo.png">
</h1>
<p align="center"> A temporary email right from your terminal written in POSIX sh</p><br>

<img src="images/demo.gif" align="right"> `tmpmail` is a command line utility written in POSIX `sh` that allows you to create a temporary email address
and receive emails to the temporary email address. It uses 1secmail's [API](https://www.1secmail.com/api/)
to receive emails.

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

## Installation
### Install locally

```bash
# Download the tmpmail file and make it executable
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
$ tmpmail --help
tmpmail -a address | -h | -l | -r | -V
tmpmail [-b browser | -t] -m | -s ID
OPTIONS
     -a | --address address
             register specified email address
     -b | --browser browser
             specify browser (default is w3m)
     -h | --help
             help
     -l | --list
             list messages
     -m | --most-recent
             show most recent message
     -r | --random
             register random email address
     -s | --show ID
             show message with ID
     -t | --text
             text output (default is html)
     -V | --version
             version
```

### Examples
Create random email
```console
$ tmpmail --random
xoithrjagpx@1secmail.net
```

Create custom email
```console
$ tmpmail --address mycustomemail@1secmail.com
mycustomemail@1secmail.com
```

View the inbox
```console
$ tmpmail -l
[ Inbox for wdebivbyjor@1secmail.com ]

83414443   username@example.com   Test Email
```

Show the email
```console
$ tmpmail -s 83414443
```

Show the most recent email
```console
$ tmpmail -m
```

Show an email message as pure text
```console
$ tmpmail -t -s 83414443
To: wdebivbyjor@1secmail.com
From: username@example.com
Subject: Test Email

Hello World
```

## Credits
This script is heavily inspired by Mitch Weaver's [`1secmail`](https://github.com/mitchweaver/bin/blob/master/application/1secmail) script
