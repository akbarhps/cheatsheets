- Build Dockerfile 

```bash
# tag: docker image tag
# example: simplebank

# version: docker image version
# example: latest

# .: path to the Dockerfile

docker build -t tag:version .
```

- Run docker image

```bash
# first 8080 is the exposed docker image port
# second 8080 is the exposed port for the external localhost machine

# imagetag: tag of the image to run
# example: simplebank
# version: version of the image to run
# example: latest

# -e: set argument to run

docker run --name imagename -p 8080:8080 -e GIN_MODE=release imagetag:version
```