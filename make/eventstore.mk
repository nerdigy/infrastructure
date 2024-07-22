.PHONY: eventstore/kill # Kills eventstore container
eventstore/kill:
	docker compose kill eventstore

.PHONY: eventstore/logs # Shows eventstore container logs
eventstore/logs:
	docker compose logs --follow --since 5m eventstore

.PHONY: eventstore/nuke # Kills eventstore container and removes volumes
eventstore/nuke: eventstore/kill
	docker compose rm eventstore --force --volumes

.PHONY: eventstore/reset # Complete reset of eventstore container
eventstore/reset: eventstore/nuke eventstore/up

.PHONY: eventstore/restart # Restarts eventstore container
eventstore/restart: eventstore/kill eventstore/up

.PHONY: eventstore/rm # Removes eventstore container
eventstore/rm:
	docker compose rm eventstore --force

.PHONY: eventstore/up # Run eventstore containers
eventstore/up:
	docker compose up eventstore --detach
