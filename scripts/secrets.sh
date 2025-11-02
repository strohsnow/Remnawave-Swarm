#!/usr/bin/env bash

SCRIPT_DIR="$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")"
SECRETS_DIR="${SCRIPT_DIR}/../secrets"

install -d -m 700 "${SECRETS_DIR}"

umask 266

POSTGRES_PASSWORD=$(openssl rand -hex 24)
echo -n "${POSTGRES_PASSWORD}" > "${SECRETS_DIR}/remnawave-postgres-password"

DATABASE_URL="postgresql://postgres:${POSTGRES_PASSWORD}@remnawave-db:5432/postgres"
echo -n "${DATABASE_URL}" > "${SECRETS_DIR}/remnawave-database-url"

echo -n "$(openssl rand -hex 64)" > "${SECRETS_DIR}/remnawave-jwt-auth-secret"
echo -n "$(openssl rand -hex 64)" > "${SECRETS_DIR}/remnawave-jwt-api-tokens-secret"
echo -n "$(openssl rand -hex 64)" > "${SECRETS_DIR}/remnawave-metrics-pass"

echo -n "$(openssl rand -hex 8)" > "${SECRETS_DIR}/remnawave-caddy-custom-login-route"
echo -n "$(openssl rand -base64 18)" > "${SECRETS_DIR}/remnawave-caddy-authp-admin-secret"

umask 066

touch "${SECRETS_DIR}/remnawave-caddy-cloudflare-api-token"
touch "${SECRETS_DIR}/remnanode-secret-key-node-domain-tld"
touch "${SECRETS_DIR}/remnanode-caddy-cloudflare-api-token"

echo "Authp login path: $(cat "${SECRETS_DIR}/remnawave-caddy-custom-login-route")"
echo "Authp admin pass: $(cat "${SECRETS_DIR}/remnawave-caddy-authp-admin-secret")"
echo "Enter remaining secrets manually"

