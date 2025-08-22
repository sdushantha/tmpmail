<h1 align="center">
  <img src="images/logo.png">
</h1>
<p align="center"> A temporary email right from your terminal written in bash</p><br>

<img src="images/demo.gif"/> `tmpmail` is a command line utility written in POSIX `bash` that allows you to create multiple inboxes
and receive temporary emails to these inboxes. It uses [emptyinbox.me API](https://emptyinbox.me/docs.html) to receive emails.

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
- `xclip`


## First time Setup
Get your APIKEY from https://emptyinbox.me
```bash
cp config.txt.sample config.txt
Edit config.txt to set APIKEY
```

## Usage
```console
$ tmpmail --help
tmpmail
tmpmail -h | --version
tmpmail -g 
tmpmail -l
tmpmail [--clipboard-cmd COMMAND] -a
tmpmail [-t | -b BROWSER] -r | ID

When called with no option and no argument, tmpmail lists the messages in
the inbox and their numeric IDs.  When called with one argument, tmpmail
shows the email message with specified ID.

-b, --browser BROWSER
        Specify BROWSER that is used to render the HTML of
        the email (default: w3m)
    --clipboard-cmd COMMAND
        Specify the COMMAND to use for copying the activation code to your
        clipboard (default: xclip -selection c)
-l, --list
        Show list of available inboxes
-g, --generate 
        Generate a new email inbox        
-a, --acode
        Auto Detect and copy activation code from recent email  
-h, --help
        Show help
-r, --recent
        View the most recent email message
-t, --text
        View the email as raw text, where all the HTML tags are removed.
        Without this option, HTML is used.
--version
        Show version
```

### Examples
Create random email
```console
$ tmpmail --generate
nutty.baby.cave@emptyinbox.me
```
View the inbox
```console
$ tmpmail

86acd15c     huge.blue.father@emptyinbox.me      New email here
f4174aed     huge.blue.father@emptyinbox.me      Test email
0ca9e983     pretty.clever.tub@emptyinbox.me     This is the subject
5d9aac58     pretty.clever.tub@emptyinbox.me     New email here
298baf00     real.dull.chin@emptyinbox.me        This is the subject

```

View the email
```console
$ tmpmail 086acd15c   
```

View the most recent email
```console
$ tmpmail -r
```

Copy activation code from recent email to clipboard
```console
$ tmpmail -a
Activation code 685539 copied to clipboard
```

View emails as pure text
```console
$ tmpmail -t 83414443
To: nutty.baby.cave@emptyinbox.me
From: username@example.com
Subject: Test Email

Hello World
```

## Credits
This script is forked from https://github.com/sdushantha/tmpmail 
