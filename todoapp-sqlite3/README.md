# require

- docker
- make


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

## startup server

```bash
make up
```

## shutdown server

```bash
make down
```

