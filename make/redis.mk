.PHONY: redis/cli # Opens redis-cli
redis/cli:
	docker compose run --rm redis redis-cli -h redis

.PHONY: redis/flush # Flushes redis
redis/flush:
	docker compose run --rm redis redis-cli -h redis FLUSHALL

.PHONY: redis/kill # Kills redis container
redis/kill:
	docker compose kill redis

.PHONY: redis/logs # Shows redis container logs
redis/logs:
	docker compose logs --follow --since 10m redis

.PHONY: redis/restart # Restarts redis container
redis/restart: redis/kill redis/up

.PHONY: redis/rm # Removes redis container
redis/rm:
	docker compose rm redis --force

.PHONY: redis/up # Run redis containers
redis/up:
	docker compose up redis --detach
