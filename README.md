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
docker run --name python-3-11 -v ${PWD}/app:/mnt -w /mnt -p 5001:5000 -p 8081:8080 -id python:3.11
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