### Application Development Environment with Docker

- docker windows mount volume python version 3.6
```bash
docker run --name python-3-6 -v "c:/users/Muhammad Asim/Desktop/app:/mnt" -w /mnt -p 5000:5000 -p 8080:8080 -id python:3.6
```

- docker windows mount volume python version 3.11
```bash
docker run --name python-3-11 -v "c:/users/Muhammad Asim/Desktop/app:/mnt" -w /mnt -p 5001:5000 -p 8081:8080 -id python:3.11
```


- docker linux/macos mount volume python version 3.6
```bash
docker run --name python-3-6 -v ${PWD}/app:/mnt -w /mnt -p 5001:5000 -p 8080:8080 -id python:3.6
```

- docker linux/macos mount volume python version 3.11
```bash
docker run --name python-3-11 -v ${PWD}/app:/mnt -w /mnt -p 5002:5000 -p 8081:8080 -id python:3.11
```


- For Windows Use dos2unix to convert file format
```bash
apt update -y && apt install -y dos2unix
dos2unix *
```

- Updated code python 3.6 application test
```bash
python3.6 app.py
```

- Updated code python 3.11 application test
```bash
python3.11 app.py
```

## MACOS Development environment with Ubuntu Desktop run MacOS on Linux (Best performance you will get on Linux Box)

### xhost
```xhost
The xhost command is used to control the access to the X server (which is responsible for graphical output on Unix-like systems).

The +local:docker argument is used to allow the Docker container to connect to your local X server. Here's what each part of the command means:

xhost: This is the command that is used to add and delete host names or user names to the list allowed to make connections to the X server.

+: This is used to add to the list. If - was used instead, it would remove from the list.

local: This means that any host on the local machine will be allowed to connect.

docker: This is the name of the host that is being allowed to connect.

So, xhost +local:docker is allowing the Docker container to connect to the X server on your local machine. This is necessary if the Docker container needs to display a GUI on your screen.

However, please note that this command reduces the security of your X server, as it allows any local user to display windows on your screen. You should only use this command if you trust all local users on your machine.
```

```bash
sudo xhost +local:docker
```

### Addtional Permissions
- If you use sudo dockerd or dockerd is controlled by systemd/systemctl, then you must be in the Docker group. If you are not in the Docker group:
```bash
sudo apt-get update
sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

sudo usermod -aG docker "${USER}"
and also add yourself to the kvm and libvirt groups if needed:

sudo usermod -aG libvirt "${USER}"
sudo usermod -aG kvm "${USER}"
```
### Github https://github.com/sickcodes/Docker-OSX
### DockerHUb https://hub.docker.com/r/sickcodes/docker-osx

- MACOS Ventura Setup
```macos
sudo apt-get update
sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

docker  run -id \
    --name macos \
    --shm-size=8192m \
     --device /dev/kvm \
    -p 50922:10022 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY:-:0.0}" \
    -e GENERATE_UNIQUE=true \
    -e MASTER_PLIST_URL='https://raw.githubusercontent.com/sickcodes/osx-serial-generator/master/config-custom.plist' \
    -e SHORTNAME=ventura \
    sickcodes/docker-osx:latest
```   

- MACOS Ventura Setup without shm-size
```macos
docker  run -id \
    --name macos \
     --device /dev/kvm \
    -p 50922:10022 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY:-:0.0}" \
    -e GENERATE_UNIQUE=true \
    -e MASTER_PLIST_URL='https://raw.githubusercontent.com/sickcodes/osx-serial-generator/master/config-custom.plist' \
    -e SHORTNAME=ventura \
    sickcodes/docker-osx:latest
```   

- MACOS add share from a host machine
```
# on Linux/Windows
mkdir ~/mnt/osx
sshfs user@localhost:/ -p 50922 ~/mnt/osx
# wait a few seconds, and ~/mnt/osx will have full rootfs mounted over ssh, and in userspace
# automated: sshpass -p <password> sshfs user@localhost:/ -p 50922 ~/mnt/osx
# Example
sudo apt install sshfs
sshfs asim@localhost:/Users/asim/Desktop -p 50922 $PWD/SHARE
```
    
- Enable SSH on MacOS
- https://osxdaily.com/2022/07/08/turn-on-ssh-mac/
```bash
Next, you will want to set up SSH to be automatically started.

sudo systemsetup -setremotelogin on

From system settings ---> Remote login enabled

# turn on SSH after you've installed OS X in the "Sharing" settings.
ssh user@localhost -p 50922
```
- Enable osascript over SSH automatically without sshd-keygen warning and full disk access
```bash
defaults write com.apple.universalaccessAuthWarning /System/Applications/Utilities/Terminal.app -bool true
defaults write com.apple.universalaccessAuthWarning /usr/libexec -bool true
defaults write com.apple.universalaccessAuthWarning /usr/libexec/sshd-keygen-wrapper -bool true
defaults write com.apple.universalaccessAuthWarning com.apple.Messages -bool true
defaults write com.apple.universalaccessAuthWarning com.apple.Terminal -bool true
```
##### Password less SSH
```bash
ssh-copy-id asim@localhost -p 50922
```

- MACOS Optmizations
- https://github.com/sickcodes/osx-optimizer

- Disable spotlight indexing on macOS to heavily speed up Virtual Instances
```bash
sudo mdutil -i off -a
```
- Reduce Motion & Transparency
```bash
defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
```

- Install Chrome and it default browser

- Disable Screen Locking
```bash
defaults write com.apple.loginwindow DisableScreenLock -bool true
```

### MACOS on Windows
- https://github.com/sickcodes/Docker-OSX#id-like-to-run-docker-osx-on-windows
- git bash
```bash
pwd
/c/Users/Muhammad Asim
cd /c/Users/Muhammad Asim
cat <<EOF > .wslconfig
[wsl2]
memory=8GB
swap=2GB
processors=2
nestedVirtualization=true
EOF
```
- After installation, go into Settings and check these 2 boxes:
```bash
General -> "Use the WSL2 based engine";
Resources -> WSL Integration -> "Enable integration with my default WSL distro",
```
- Navigate to your WSL2 Installation which is ubuntu
```bash
wsl
sudo apt update -y
sudo apt -y install bridge-utils cpu-checker libvirt-clients libvirt-daemon qemu qemu-kvm cpu-checker x11-xserver-utils x11-apps
exit
wsl --shutdown
wsl
sudo kvm-ok
```

- powershell as administrator
```powershell
wsl --list --verbose


  NAME                    STATE           VERSION
* Ubuntu-20.04            Stopped         1
  docker-desktop-data     Stopped         2
  rancher-desktop         Stopped         2
  docker-desktop          Stopped         2
  rancher-desktop-data    Stopped         2
  
  
  
PS C:\WINDOWS\system32> dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart


Deployment Image Servicing and Management tool
Version: 10.0.22621.1

Image Version: 10.0.22621.1778

Enabling feature(s)
[==========================100.0%==========================]
The operation completed successfully.


PS C:\WINDOWS\system32> wsl --set-default-version 2

wsl --set-version Ubuntu-20.04 2

wsl --list --verbose


  NAME                    STATE           VERSION
* Ubuntu-20.04            Stopped         2----------------------------------------> WSL2
  docker-desktop-data     Stopped         2
  rancher-desktop         Stopped         2
  docker-desktop          Stopped         2
  rancher-desktop-data    Stopped         2
```

- docker MACOS Windows (Note: this command will run on ubuntu linux)
- https://github.com/sickcodes/Docker-OSX/discussions/458
```bash
wsl --update
wsl --shutdown
```
- wsl
```bash
docker run --name macos -it --device /dev/kvm -p 50922:10022 -p 5999:5999 -p 5998:5998 -v /tmp/.X11-unix:/tmp/.X11-unix -e EXTRA="-display none -vnc 0.0.0.0:99,password=on" -e "DISPLAY=${DISPLAY:-:0.0}" -e GENERATE_UNIQUE=true -e MASTER_PLIST_URL='https://raw.githubusercontent.com/sickcodes/osx-serial-generator/master/config-custom.plist' sickcodes/docker-osx:ventura
```

- VNC Password
- press ENTER
```bash
change vnc password asim
```
- VNC
- https://www.realvnc.com/en/connect/download/viewer/windows/
```bash
localhost:5999

password: asim
```
-  After Installation reconnect with container
-  press "q" it will exit the last shell
```bash
docker start -a -i `docker ps -q -l`

docker start -a -i: This starts a Docker container in interactive mode and attaches the STDOUT/STDERR.
`docker ps -q -l`: This is a sub-command that is executed first. The docker ps -q -l command gets the ID of the last created Docker container. The -q flag makes the command only return the numeric ID of the container, and the -l flag stands for "latest", meaning the last container that was created.
So, the entire command starts the most recently created Docker container in interactive mode.

PRESS ENTER

change vnc password asim
```
- command
```bash
docker start -a -i macos

docker start: This is the command to start a Docker container.
-a: This option attaches the STDOUT/STDERR and forwards signals.
-i: This option makes Docker interactive by keeping STDIN open even if not attached.
macos: This is the name of the Docker container you want to start.
```
