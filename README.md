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

## MACOS Development environment with Ubuntu Desktop run MacOS on Linux

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
sudo usermod -aG docker "${USER}"
and also add yourself to the kvm and libvirt groups if needed:

sudo usermod -aG libvirt "${USER}"
sudo usermod -aG kvm "${USER}"
```
- Github https://github.com/sickcodes/Docker-OSX

- MACOS Ventura Setup
```macos
docker run -id \
    --shm-size=8192m \
    --device /dev/kvm \
    -p 50922:10022 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY:-:0.0}" \
    -e GENERATE_UNIQUE=true \
    -e MASTER_PLIST_URL='https://raw.githubusercontent.com/sickcodes/osx-serial-generator/master/config-custom.plist' \
    sickcodes/docker-osx:ventura
```   

- MACOS Ventura Setup without shm-size
```macos
docker run -id \
    --shm-size=8192m \
    --device /dev/kvm \
    -p 50922:10022 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY:-:0.0}" \
    -e GENERATE_UNIQUE=true \
    -e MASTER_PLIST_URL='https://raw.githubusercontent.com/sickcodes/osx-serial-generator/master/config-custom.plist' \
    sickcodes/docker-osx:ventura
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
sudo apt -y install bridge-utils cpu-checker libvirt-clients libvirt-daemon qemu qemu-kvm cpu-checker
exit
wsl --shutdown
wsl
sudo kvm-ok
```
