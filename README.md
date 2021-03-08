# Brutal Doom v21 - Docker

The Brutal Doom docker project

Run Brutal Doom on docker image, depends on X11 server. (i.e: XQuartz)



## articles
This image was built based on articles by [Xerxes Lins](mailto:xerxeslins@gmail.com)

* [JOGUE DOOM CLÁSSICO COMPLETO NO LINUX COM PRBOOM](https://www.vivaolinux.com.br/artigos/impressora.php?codigo=15116) 
* [BRUTAL DOOM NO LINUX MINT (UBUNTU)](https://www.vivaolinux.com.br/artigos/impressora.php?codigo=15129) 

## brutal doom files
* [Brutal Doom v21](https://www.moddb.com/mods/brutal-doom/downloads/brutal-doom-v21-beta)
* [Doom Metal v5](https://www.moddb.com/mods/brutal-doom/downloads/doom-metal-soundtrack-mod-volume-5)
  This is a large file to [github](https://github.com) download and copy the file [DoomMetalVol5.wad](https://www.moddb.com/mods/brutal-doom/downloads/doom-metal-soundtrack-mod-volume-5) into dir `usr/games/zandronum/skins`.

## Pulse audio
* Mac/Windows
Install Pulse audio to enable the container to access host audio device
 
 MacOS
 ```
 brew install pulseaudio
 ```

## docker

### building

```
$ bashpulseaudio --load=module-native-protocol-tcp --exit-idle-time=-1 --daemon
xhost + <HOST IP>
$ docker build --pull --rm -f Dockerfile -t pedrorobsonleao/brutaldoom:latest .
```

### running

#### doomseeker
```bash
$ docker run \
        --rm \
        -e DISPLAY=<HOST IP> \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --mount type=bind,source=$HOME/.config/pulse,target=/home/developer/.config/pulse \  
        pedrorobsonleao/brutaldoom
```
![doomseeker](img/Doomseeker.png)

#### zandronum
```bash
$ docker run \
        --rm \
        -e DISPLAY=<HOST IP> \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --mount type=bind,source=$HOME/.config/pulse,target=/home/developer/.config/pulse \  
        pedrorobsonleao/brutaldoom zandronum
```
![doomseeker](img/Zandronum.png)

### freedoom

#### freedoom1
```bash
$ docker run \
        --rm \
        -e DISPLAY=<HOST IP> \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --mount type=bind,source=$HOME/.config/pulse,target=/home/developer/.config/pulse \  
        pedrorobsonleao/brutaldoom freedoom1
```
![freedom1](img/Freedoom1.png)


#### freedoom2
```bash
$ docker run \
        --rm \
        -e DISPLAY=<HOST IP> \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --mount type=bind,source=$HOME/.config/pulse,target=/home/developer/.config/pulse \  
        pedrorobsonleao/brutaldoom freedoom2
```
![freedom2](img/Freedoom2.png)

### prboom-plus

```bash
$ docker run \
        --rm \
        -e DISPLAY=<HOST IP> \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --mount type=bind,source=$HOME/.config/pulse,target=/home/developer/.config/pulse \  
        pedrorobsonleao/brutaldoom prboom-plus 
```
![prboom-plus](img/Prboom-plus.png)
---
```bash
$ docker run \
        --rm \
        -e DISPLAY=<HOST IP> \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --mount type=bind,source=$HOME/.config/pulse,target=/home/developer/.config/pulse \  
        pedrorobsonleao/brutaldoom prboom-plus -iwad doom2.wad -file tnt.wad
```
![prboom-plus1](img/Prboom-plus1.png)
---
```bash
$ docker run \
        --rm \
        -e DISPLAY=<HOST IP> \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --mount type=bind,source=$HOME/.config/pulse,target=/home/developer/.config/pulse \  
        pedrorobsonleao/brutaldoom prboom-plus -iwad doom2.wad -file plutonia.wad
```
---
![prboom-plus2](img/Prboom-plus2.png)
