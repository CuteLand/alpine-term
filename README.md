# Alpine Term

An application that runs [Alpine Linux](https://alpinelinux.org) distribution on
your Android device.

*Inspired by [Termux](https://github.com/termux/termux-app) and
[UserLAnd](https://github.com/CypherpunkArmory/UserLAnd) applications.*

## What is this app for ?

This application is general purpose as it runs a full blown Linux distribution.
You are limited only by amount of available packages (more than 10000) as Alpine
Linux is relatively new distribution, however you can compile missing packages
on your own. Performance can be a problem in some cases too.

Here is just a few ideas for what you can use Alpine Term application:

 - Educational purposes.

 - Development environment: compile & test your programs written in C, C++, Go,
   Python, etc... But remember that emulator performance is limited.

 - Experimental sandbox: here you free for executing all kinds of potentially
   dangerous stuff without being afraid of damaging your host OS.

 - Run a local web server or TOR hidden service.

 - Run x86 Linux programs on your ARM(64) device. Note that a Docker container
   with Ubuntu may be required. Alpine Linux uses a Musl libc and programs compiled
   for systems based on GNU libc may not work.

 - Run software which requires root, but you don't want to root your device.

**This application does not provide access to host hardware or operating system.**
You cannot use it to root your device, flash custom ROMs, run Aircrack-NG, access
USB OTG devices, etc...

**This application is not a terminal emulator for Android OS.** If you searching for
one, check [Termux](https://github.com/termux/termux-app/) project.

A page with brief explanation about usage can be accessed through context menu
inside application or you can view it online at this link: https://xeffyr.github.io/alpine-term/docs/help.html.

Information about Alpine Linux tips and tricks can be accessed through its official
Wiki: https://wiki.alpinelinux.org/wiki/Main_Page.

<p align="center"><img src="help-page/img/demo_anim.gif" width="60%"></p>

**Disclaimer**: by installing this software, you are agreeing to use it
on your own risk. Alpine Term comes with disk image file containing the
software developed by third-parties. [Author](https://github.com/xeffyr)
is not responsible for any damage that may affect your device or data.

## System requirements

In general, it should work on any high-end device which met the following
requirements:

 - Android 7.0 or higher.
 - At least 1 GB of space on the internal storage.

## Extra packages

Check the https://github.com/xeffyr/alpine-extra-ports for some additional
packages which may not be available in Alpine official repositories. Mostly
tuned for my needs.

## Consider this before opening a new [issue](https://github.com/xeffyr/alpine-term/issues)

**Bugs**:

 Consider opening an issue if you found that application crashes or not working
 at all on your device. Note that app can have same bugs as [Termux](https://github.com/termux/termux-app/)
 as many parts of code were borrowed from this project.

 I do not accept any issues about packages or used operating system. They are
 third-party projects not related to this application.

**New features**:

 Application is kept on bare minimum of features.

 Most of things can be already done either through OS shell or QEMU monitor console,
 for example backups to Android shared storage or custom drive images. I'm not
 Android developer and won't bother to reimplement these things through GUI.

## Credits

Alpine Term relies on the source code of the following projects:

 - [Termux](https://github.com/termux/termux-app)
 - [QEMU](https://qemu.org)
 - [Socat](http://www.dest-unreach.org/socat/)
