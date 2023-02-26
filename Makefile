refresh: down build up

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -ft

shell:
	docker compose exec printer-test bash

build:
	docker compose build

