# require

- docker
- make
- node 18+


# how to run

## create image

```bash
make build
```

## setup

```bash
make setup
```

## create database, apply migration, show status

```bash
make db-create
make db-migrate
make db-status
```

## build assets


```bash
npm install
npm run build
```


## startup server

```bash
make up
```

## shutdown server

```bash
make down
```

