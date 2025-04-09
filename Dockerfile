FROM node:20.19.0-bookworm as node
FROM python:3.14.0a7-bookworm as python
FROM koalaman/shellcheck:v0.10.0 as shellcheck
FROM mvdan/shfmt:v3.11.0 as shfmt
FROM hadolint/hadolint:v2.12.0 as hadolint

FROM ubuntu:jammy-20250404 as base

USER root

ENV INSIDE_DOCKER=1
ENV USERNAME=app-user
ARG GROUPNAME=${USERNAME}
ARG USER_UID=1000
ARG USER_GID=${USER_UID}
ENV HOME=/home/${USERNAME}
ENV APP_DIR=/app

RUN set -e \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -y -qq --no-install-recommends ca-certificates=* git=* sudo=* gcc=* build-essential=* \
  && echo "--- Give sudo rights to 'USERNAME' ---" \
  && echo "${USERNAME}" ALL=\(root\) NOPASSWD:ALL >/etc/sudoers.d/"${USERNAME}" \
  && chmod 0440 /etc/sudoers.d/"${USERNAME}" \
  && echo "--- Clean ---" \
  && apt-get clean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/*

# Add user and project directory
RUN \
  groupadd --gid ${USER_GID} ${GROUPNAME} \
  && useradd --uid ${USER_UID} --gid ${USER_GID} --shell /bin/bash \
    --create-home ${USERNAME} \
  && mkdir ${APP_DIR} \
  && chown ${USER_GID}:${USER_GID} ${APP_DIR}

# Add shellcheck
COPY --from=shellcheck --chown=root /bin/shellcheck /usr/local/bin/

# Add shfmt
COPY --from=shfmt --chown=root /bin/shfmt /usr/local/bin/

# Add hadolint
COPY --from=hadolint --chown=root /bin/hadolint /usr/local/bin/

# Add NodeJS (without yarn)
COPY --from=node --chown=root /usr/local/bin /usr/local/bin/
COPY --from=node --chown=root /usr/local/include /usr/local/include/
COPY --from=node --chown=root /usr/local/lib /usr/local/lib/
COPY --from=node --chown=root /usr/local/share /usr/local/share/
# Remove dead symbolic links from yarn
RUN find /usr/local/bin/. -xtype l -exec rm {} \; 2>/dev/null

# Add Python
COPY --from=python --chown=root /usr/local/lib /usr/local/lib
COPY --from=python --chown=root /usr/local/include /usr/local/include/
COPY --from=python --chown=root /usr/local/bin /usr/local/bin

USER ${USERNAME}

WORKDIR ${APP_DIR}

# Install project packages
COPY --chown=${USERNAME} package-lock.json package.json .npmrc ./
RUN set -e \
  && npm ci --quiet \
  && touch node_modules/.gitkeep

ENV \
  LD_LIBRARY_PATH=/usr/local/lib \
  PATH=${HOME}/.local/bin:${PATH}
COPY --chown=${USERNAME} requirements.txt ./
RUN set -e \
  && pip install -q --no-cache-dir -r requirements.txt

CMD [ "bash" ]

FROM base as dev

USER root

RUN set -e \
  && export DEBIAN_FRONTEND=noninteractive \
  && echo "--- Install packages ---" \
  && apt-get update -qq \
  && apt-get install -y -qq --no-install-recommends \
    gnupg2=* \
    openssh-client=* \
    locales=* \
  && echo "--- Add locales ---" \
  && sed -i "/en_US.UTF-8/s/^# //g" /etc/locale.gen \
  && locale-gen "en_US.UTF-8" \
  && echo "--- Clean ---" \
  && apt-get clean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/*

USER ${USERNAME}

FROM dev as vscode

WORKDIR ${HOME}

RUN set -e \
  && mkdir -p .vscode-server/extensions \
    .vscode-server-insiders/extensions \
  && chown -R "${USERNAME}" \
    .vscode-server \
    .vscode-server-insiders

WORKDIR ${APP_DIR}
