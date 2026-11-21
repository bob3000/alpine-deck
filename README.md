# Alpine Deck

Meta packages containing a custom package selection and configuration.

## Getting Started

### Build packages

First setup

```sh
doas apk add alpine-sdk busybox-extras git
doas adduser "$USER" abuild
abuild-keygen -a -i
````

Package build

```sh
cd deck-config && abuild checksum && abuild -r
cd deck-base && abuild checksum && abuild -d
```

### Serving packages

```sh
doas mkdir -p /etc/apk/repositories.d
echo "http://localhost:8080/alpine-deck" | doas tee /etc/apk/repositories.d/localhost.list
doas cp ~/.abuild/*.rsa.pub /etc/apk/keys/
busybox httpd -f -p 8080 -h ~/packages &
doas apk update
doas apk add deck-base deck-config
```
