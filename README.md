# dockerized radvent

Original app: https://github.com/nanonanomachine/radvent

## Getting Started

### 1. Clone
```
$ git clone --recursive https://github.com/opt-itoh/dockeradvent.git && cd dockeradvent
```

### 2. Setup

Environment variables
```
$ cat <<EOF > .env
YEAR=2018
RAILS_ENV=production
EOF
```


Basic authentication
```
$ docker run --rm httpd:2.4.37-alpine sh -c "htpasswd -nb YOUR_NAME YOUR_PASSWORD" > web/.htpasswd
```

### 3. Run
```
$ docker-compose up -d
```


## Thanks
* [Yohei Koyama](https://github.com/nanonanomachine) the author of radvent
