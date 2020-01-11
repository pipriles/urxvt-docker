## Why?

Because I wanted to be able to use a Linux terminal on Windows that works exactly the same as in my laptop.
I usually use vim for my work and I need it to be consistent on every machine I work with, Windows does not offer me that and also it takes a lot of time to make everything work...
So this allows me to easily setup and start working without worries.

I am not pretty sure how this `Dockerfile` would change if you are using Linux in your host machine.

## How to

I recommend you to read this article on how to [run a GUI app in linux docker container on windows host](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde) that helped me to accomplish this.

You must first have a X server to connect to... In Windows you can install [VcXsrv](https://sourceforge.net/projects/vcxsrv/) which is an Open Source implementation based on the Xorg Git sources.

I personally used `chocolatey`:

`choco install vcxsrv`

Then run `XLaunch` on Windows and setup the server (Make sure to check the "Disable access control" option).

**Compile it**

`docker build -t urxvt .`

**Run it**

`docker run -v home:/root -v PATH_TO_ANYTHING:/mnt urxvt`

As you can see I attach two volumes to the container, one will have the `/root` which will be created on the first time so I can persist information of the session, which is kind of useful if you also use the terminal inside `neovim`…

The other volume is to access files from the host inside the container (Like your work folder).

I decided to not install the vim plugins when compiling the image but instead use the volume as a mechanism to persist that kind of stuff.

## TO-DO

- [ ] Setup some kind of server to move files between windows and the container easy.
- [ ] Think about a way to make this work in Linux too (without the host.docker.internal trick).
- [ ] Migrate to Arch Linux because I want to.
- [ ] Maybe use another use that is not root?
- [ ] Organize better the .Xresources and .vimrc files
- [ ] Install ranger

