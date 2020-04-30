#!/usr/bin/env bash

openssl req \
    -newkey rsa:2048 \
    -x509 \
    -nodes \
    -keyout server.key \
    -new \
    -out server.crt \
    -subj /CN=*.product.local \
    -reqexts SAN \
    -extensions SAN \
    -config <(cat /System/Library/OpenSSL/openssl.cnf \
        <(printf '[SAN]\nsubjectAltName=DNS:product.local,DNS:tenant-a.product.local,DNS:tenant-b.product.local')) \
    -sha256 \
    -days 3650

openssl pkcs12 -inkey server.key -in server.crt -export -out server.pfx
