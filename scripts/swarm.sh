#!/usr/bin/env bash

tailscale down && tailscale up
TAILSCALE_IP="$(tailscale ip -4)"

docker swarm init --advertise-addr "${TAILSCALE_IP}"

docker network create -d overlay edge-network
docker network create -d overlay remnawave-network

