# Setup development environment

## Install

1. Install [docker](https://docs.docker.com/get-docker/) 19.03.0+.
1. Install [docker-compose](https://docs.docker.com/compose/install/) 1.26.0+.

### Development with VSCode - Remote container (recommended)

1. Be sure to have the [minimum requirements](https://code.visualstudio.com/docs/remote/containers).
1. Install the extension `ms-vscode-remote.remote-containers`.
1. `Ctrl+Shift+P` and choose `Remote-Containers: Open Folder in Container...`
1. Wait container to be built (it takes a while).
1. Run `./run help` to see all commands for this project.

### Development without VSCode

1. Run `./run dev:code` to enter the container.
1. Run `./run help` to see all commands for this project.

## UID and GID inside the container

You can change the user's UID/GID inside the container, you can export the
variables `USER_UID` and/or `USER_GID`. This can be used when using
`./run dev:code` or `./run dev:run`.

```bash
export USER_UID=1000 USER_GID=1000; ./run dev:code
```

Note: On Linux, VSCode container handles user's UID/GID by itself. Read the
description of `remoteUser` and `updateRemoteUserUID` on this [page](https://code.visualstudio.com/docs/remote/devcontainerjson-reference#_devcontainerjson-properties).
