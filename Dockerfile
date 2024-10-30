FROM alpine:latest

LABEL "com.github.actions.name"="Create Tar File"
LABEL "com.github.actions.description"="Create a tar file containing specific files from your repository"
LABEL "com.github.actions.icon"="folder-plus"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="https://github.com/developerdino/action-tar"
LABEL "homepage"="https://github.com/developerdino/action-tar"
LABEL "maintainer"="Dean Tedesco <dino@tedesco.net.au>"

RUN apk add tar bzip2 gzip xz