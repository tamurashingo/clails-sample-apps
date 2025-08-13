build:
	docker compose build clails
setup:
	docker compose run --entrypoint qlot clails install

db-create:
	docker compose run --entrypoint clails clails db:create
db-migrate:
	docker compose run --entrypoint clails clails db:migrate
db-status:
	docker compose run --entrypoint clails clails db:status

up:
	docker compose up

down:
	docker compose down

console:
	docker compose run --entrypoint /bin/bash clails
