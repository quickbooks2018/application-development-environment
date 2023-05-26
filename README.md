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

- MACOS Development environment with Ubuntu Desktop run MacOS on Linux

- xhost
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
xhost +local:docker
```
- Github https://github.com/sickcodes/Docker-OSX

- MACOS Ventura Setup
```macos
docker run -it \
    --device /dev/kvm \
    -p 50922:10022 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY:-:0.0}" \
    -e GENERATE_UNIQUE=true \
    -e MASTER_PLIST_URL='https://raw.githubusercontent.com/sickcodes/osx-serial-generator/master/config-custom.plist' \
    sickcodes/docker-osx:ventura
```   
    
