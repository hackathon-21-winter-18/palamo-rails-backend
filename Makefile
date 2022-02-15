.PHONY: up-b
up-b:
	@docker-compose up --build

.PHONY: up
up:
	@docker-compose up

.PHONY: stop
stop:
	@docker compose stop

.PHONY: down
down:
	@docker-compose down -v

.PHONY: logs
logs:
	@docker compose logs -f

.PHONY: db
db:
	@docker exec -it rails-mysql bash

.PHONY: app
app:	
	@docker exec -it rails-api bash

.PHONY: redis
redis:
	@docker exec -it rails-redis bash