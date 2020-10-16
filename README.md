# fedora-3.1-docker
Fedora Digital Repository v3.1 Docker

## Build Docker
```shell
$ docker build -t pcharoen/fedora:3.1 .
```

## Push Docker
```shell
$ docker push pcharoen/fedora:3.1
```

## Change Fedora Data Directory
- Modify Fedora data volume in docker-compose.yml mapping to local directory
```yml
  fedora:
    restart: always
    image: pcharoen/fedora:3.1
    depends_on: 
      - mysql
    volumes:
      - fedora:/home/fedora-3.1
      - [./data]:/home/fedora-3.1/data
```

## Start Fedora Docker
```shell
$ docker-compose up -d
```

## Run fedora-admin
```shell
$ tar -xf fedora-3.1.tar.gz
$ cd fedora-3.1/client/bin
$ export FEDORA_HOME=../../
$ ./fedora-admin.sh
```

## Ingest Demo Objects
```shell
$ ./fedora-ingest-demos.sh localhost 8080 fedoraAdmin fedoraAdmin http
```

## Rebuild MySQL Database
Rebuilding MySQL database from existing Fedora data
- Modify Fedora data directory in docker-compose.yml pointing to Fedora data on local machine
- Run fedora-rebuild.sh then select option 2 and confirm
```shell
$ docker exec -it fedora31 /bin/bash
$ cd /home/fedora-3.1/server/bin
$ export FEDORA_HOME=../../
$ ./fedora-rebuild.sh
```