# INotify PDF Tools Docker Container

The container is intended to monitor the `input` folder. As soon as a new file is created there, the `$CMD` environment variable is executed.

## Usecase

I use the container to split PDF files from my printer into separate PDF documents for subsequent processing separately.

Since my printer (Brother ADS-2600We, Brother MFC 9332CDW) does not support batch processing into separate PDF files, I created this container.

## Docker Container

The following packages are currently installed:

- inotify to monitor the folders (https://wiki.ubuntuusers.de/inotify/)
- poppler-utils (https://wiki.ubuntuusers.de/poppler-utils/ https://packages.debian.org/de/sid/poppler-utils)

| Name               | Default Value        |                                               |
|--------------------|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `UID`        | 1036    | UserId of the user running in the docker container  |
| `GID`        | 1036    | GroupId of the user running in the docker container  |
| `TZ`        | Europe/Berlin    | Timezone  |
| `VOLUMES`        | /input/    | observed files or folders (**must be split by whitespace**) |
| `CMD`        | pdfseparate #### /output/####-%d.pdf; rm ####    | command which is called when new files are created. **#### is automatically replaced by the filename**  |

### Docker Compose

sample

```yml
version: "2"
services:
  homer:
    image: ghcr.io/djonasdev/docker-inotify-pdf-tools:latest
    container_name: pdftools-split
    restart: unless-stopped
    labels:
      - com.centurylinklabs.watchtower.enable=true
    environment:
      UID: "1073"
      GID: "1073"
      TZ: "Europe/Berlin"
      VOLUMES: "/input/"
      CMD: "pdfseparate #### /output/####-%d.pdf; rm ####"
    volumes:
      - pdf-split:/input
      - dms:/output
```

## License

This Dockerfile and scripts are released under [MIT License](https://github.com/djonasdev/docker-inotify-pdf-tools/blob/master/LICENSE).