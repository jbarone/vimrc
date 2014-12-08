Joshua Barone's VIM Configuration
=================================

Installation
------------

There is a separate branch for each supported operating system. But there are a
few dependencies that need to be met. Insure the following are installed:

- git
- python 2.7
- pip install powerline-status
- golang
- go get -u github.com/nsf/gocode

Once these dependencies are met, install the configuration using the following
steps:

	$ cd ~
	$ git clone git://github.com/jbarone/vimrc --branch <os> --single-branch <vim folder>
	$ cd <vim folder>
	$ git submodule init
	$ git submodule update

os: should be replaced with windows, linux, or mac.
vim folder: should be replaced with .vim for linux or mac, or vimfiles for windows.

---

Copyright (c) 2014, Joshua Barone. All rights reserved.
