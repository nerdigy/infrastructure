.PHONY: postgres/kill # Kills postgres container
postgres/kill:
	docker compose kill postgres

.PHONY: postgres/logs # Shows postgres container logs
postgres/logs:
	docker compose logs --follow --since 5m postgres

.PHONY: postgres/nuke # Kills postgres container and removes volumes
postgres/nuke: postgres/kill
	docker compose rm postgres --force --volumes

.PHONY: postgres/reset # Complete reset of postgres container
postgres/reset: postgres/nuke postgres/up

.PHONY: postgres/restart # Restarts postgres container
postgres/restart: postgres/kill postgres/up

.PHONY: postgres/rm # Removes postgres container
postgres/rm:
	docker compose rm postgres --force

.PHONY: postgres/up # Run postgres containers
postgres/up:
	docker compose up postgres --detach
