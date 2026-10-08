<h1 align="center">
  <img src="images/logo.png">
</h1>
<p align="center"> A temporary email right from your terminal written in POSIX sh</p><br>

<img src="images/demo.gif" align="right"> `tmpmail` is a command line utility written in POSIX `sh` that allows you to create a temporary email address
and receive emails to the temporary email address.

> **This is a maintained fork of [sdushantha/tmpmail](https://github.com/sdushantha/tmpmail).**
> Upstream used 1secmail's API, which has shut down (every request now returns `403 Forbidden`), so the
> original script no longer works. This fork talks to [Guerrilla Mail](https://www.guerrillamail.com/)
> by default, with [mail.tm](https://mail.tm/) as an alternative (`--provider mailtm`).

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
- `xclip` (optional, only for `--copy`)

## Installation
### Install locally

```bash
# Download the tmpmail file and make it executable
$ curl -L "https://raw.githubusercontent.com/3-mmc/tmpmail/master/tmpmail" > tmpmail && chmod +x tmpmail

# Then move it somewhere in your $PATH. Here is an example:
$ mv tmpmail ~/bin/
```

### Packages
The AUR (`tmpmail-git`), Pacstall (`tmpmail-bin`) and Nixpkgs (`tmpmail`) packages build the **upstream** script,
which still points at the dead 1secmail API. Until they switch to this fork, install it locally as shown above.

### Docker

requirements:
 - [docker](https://www.docker.com/)
 - clone this repo

```bash                                                                                        
$ docker build -t mail .; # Dockerfile available in source code
$ docker run -it mail;
```   

## Usage
```console
$ tmpmail --help
tmpmail
tmpmail -h | --version
tmpmail [-p PROVIDER] -g [ADDRESS | USERNAME]
tmpmail [-t | -b BROWSER] -r | ID

When called with no option and no argument, tmpmail lists the messages in
the inbox and their numbers.  When called with one argument, tmpmail
shows the email message with that number (1 = newest).

-b, --browser BROWSER
        Specify BROWSER that is used to render the HTML of
        the email (default: w3m)
    --clipboard-cmd COMMAND
        Specify the COMMAND to use for copying the email address to your
        clipboard (default: xclip -selection c)
-c, --copy
        Copy the email address to your clipboard
-d, --domains
        Show list of available domains
-g, --generate [ADDRESS | USERNAME]
        Generate a new email address, either the specified ADDRESS, a
        USERNAME on a random domain, or a completely random one
-h, --help
        Show help
-p, --provider PROVIDER
        Service used for new addresses: guerrilla (default) or mailtm.
        Can also be set with TMPMAIL_PROVIDER. An existing address keeps
        the provider it was made with.
-r, --recent
        View the most recent email message
-t, --text
        View the email as raw text, where all the HTML tags are removed.
        Without this option, HTML is used.
--version
        Show version
```

### Providers
| | Guerrilla Mail (`guerrilla`, default) | mail.tm (`mailtm`) |
| --- | --- | --- |
| Account | none, an address is just a username | created for every address |
| Domains | 11, all delivering to the same inbox | usually one |
| Mail kept | about an hour | until the account is deleted |
| Privacy | anyone who guesses the username can read the inbox | password protected |
| Limits | | account creation is rate limited |

The address, its provider and (for mail.tm) its password are stored in `/tmp/tmpmail`, so they are gone after a reboot.

### Examples
Create random email
```console
$ tmpmail --generate
an8xsqzo1ct@guerrillamailblock.com
```

Create custom email
```console
$ tmpmail --generate mycustomemail@sharklasers.com
mycustomemail@sharklasers.com
```

Pick only the username, on a random domain
```console
$ tmpmail --generate mycustomname
mycustomname@guerrillamail.net
```

Use mail.tm instead
```console
$ tmpmail --provider mailtm --generate
```

View the inbox
```console
$ tmpmail
[ Inbox for mycustomname@guerrillamail.net ]

1     no-reply@guerrillamail.com     Welcome to Guerrilla Mail
```

View the email
```console
$ tmpmail 1
```

View the most recent email
```console
$ tmpmail -r
```

View emails as pure text
```console
$ tmpmail -t 1
To: mycustomname@guerrillamail.net
From: no-reply@guerrillamail.com
Subject: Welcome to Guerrilla Mail

Dear Random User,
...
```

Attachments are downloaded to `/tmp/tmpmail/attachments/` and linked from the email.

## Credits
This script is heavily inspired by Mitch Weaver's [`1secmail`](https://github.com/mitchweaver/bin/blob/master/OLD/1secmail) script

The original `tmpmail` is by [Siddharth Dushantha](https://github.com/sdushantha).
