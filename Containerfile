FROM ghcr.io/n3ddu8/alpine-base:nightly

ENV PATH=${PATH}:/opt/mssql-tools/bin

EXPOSE 1433

RUN apk update
RUN apk add just

WORKDIR $HOME

COPY .justfile .

RUN just .
