# Alpine Term

Alpine Term (Alpine Linux Terminal) is a virtual machine running the
[Alpine Linux](https://alpinelinux.org) — a security-oriented, lightweight
Linux distribution based on musl libc and busybox.

The application is built on top of these 2 core components:

 - [QEMU](https://qemu.org) — hardware emulator and virtualizer. Used to
   emulate x86_64 hardware on which Alpine Linux is running.

 - Terminal emulator — a heavily modded version of [Termux](https://github.com/termux),
   terminal emulator for Android OS. Used for interacting with the virtual machine and
   operating system.

Application design is minimalistic. You will not find here any overweight
functionality. Only the bare minimum of what is needed for interacting with
the virtual machine.

Online help page: https://xeffyr.github.io/alpine-term/docs/help.html. Offline
variant is supplied within the application.

Information about Alpine Linux tips and tricks can be accessed through its official
Wiki: https://wiki.alpinelinux.org/wiki/Main_Page.

<p align="center"><img src="/help-page/img/demo_anim.gif" width="90%"/></p>

## What is this app for?

This application is a general purpose as it runs a full blown Linux distribution.
Alpine Linux has more than 10000 packages in its repositories and you can compile
your own. However, the hardware emulation leads to significant performance penalty.

Here is just a few ideas for what you can use Alpine Term application:

 - Educational purposes.

 - Development environment: compile & test your programs written in C, C++, Go,
   Python, etc.

 - Experimental sandbox: here you free for executing all kinds of potentially
   dangerous stuff without being afraid of damaging your host OS.

 - Run a local web server or TOR hidden service.

 - Run x86 Linux programs on your ARM(64) device.

 - Run software which requires root without rooting your Android device.

Alpine Term is NOT a terminal emulator for Android, rooting tool or hacking toolset.

## Installation

**Disclaimer**: by installing this software, you are agreeing to use it
on your own risk. Alpine Term comes with a disk image file containing the
software developed by third-parties. [Author](https://github.com/xeffyr)
is not responsible for any damage that may affect your device or data.

Alpine Term is provided in 2 variants:

 - Standard - small, only basic utilities are pre-installed in the VM image.

   Download: [alpine-term-v11.0-standard.apk](https://github.com/xeffyr/alpine-term/releases/download/v11.0/alpine-term-v11.0-standard.apk)

 - Ultimate - large, many utilities are available out-of-box. Close to configuration what I'm actually using.

   Download: [alpine-term-v11.0-ultimate-r1.apk](https://github.com/xeffyr/alpine-term/releases/download/v11.0/alpine-term-v11.0-ultimate-r1.apk)

Android OS version 7.0 or higher is required. As for storage space - QEMU disk
partition is limited to 4 GB, so consider that as minimal free disk space requirement
even though *standard* build works fine with 1 GB free.

## Alternate OS images

This application is primarily intended to boot Alpine Linux only, but other
operating systems should work too as soon as they have drivers for VirtIO
hardware.

Following pre-built QEMU images are available:

* Arch Linux (561M): [archlinux-alpine-term-r2020.07.02.qcow2](https://github.com/xeffyr/alpine-term/releases/download/v11.0/archlinux-alpine-term-r2020.07.02.qcow2)
* Debian 10 (670M): [debian10-alpine-term-r2020.07.01-1.qcow2](https://github.com/xeffyr/alpine-term/releases/download/v11.0/debian10-alpine-term-r2020.07.01-1.qcow2)

To use one of these images, download it, rename to `hdd.qcow2` and place
exactly at this location:
```
/storage/emulated/0/Android/data/alpine.term/files/
```
Image will be added as secondary drive on cold start. You can select to boot
from it in BIOS menu.

## Credits

Alpine Term relies on the source code of the following projects:

 - [Termux](https://github.com/termux/termux-app)
 - [QEMU](https://qemu.org)
 - [Socat](http://www.dest-unreach.org/socat/)
