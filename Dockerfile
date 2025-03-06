FROM python:3.12-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ARG NB_USER=pdfplumber
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

RUN apt-get -q update && apt-get -qy dist-upgrade
RUN apt-get -qy install gcc make

COPY . ${HOME}
WORKDIR ${HOME}
RUN uv run make venv

RUN chown -R ${NB_UID} ${HOME}
USER ${USER}
