FROM debian:13-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends redir \
    && rm -rf /var/lib/apt/lists/*
