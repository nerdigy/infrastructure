.PHONY: rabbitmq/kill # Kills rabbitmq container
rabbitmq/kill:
	docker compose kill rabbitmq

.PHONY: rabbitmq/logs # Shows rabbitmq container logs
rabbitmq/logs:
	docker compose logs --follow --since 10m rabbitmq

.PHONY: rabbitmq/nuke # Kills rabbitmq container and removes volumes
rabbitmq/nuke: rabbitmq/kill
	docker compose rm rabbitmq --force --volumes

.PHONY: rabbitmq/reset # Complete reset of rabbitmq container
rabbitmq/reset: rabbitmq/nuke rabbitmq/up

.PHONY: rabbitmq/restart # Restarts rabbitmq container
rabbitmq/restart: rabbitmq/kill rabbitmq/up

.PHONY: rabbitmq/rm # Removes rabbitmq container
rabbitmq/rm:
	docker compose rm rabbitmq --force

.PHONY: rabbitmq/up # Run rabbitmq containers
rabbitmq/up:
	docker compose up rabbitmq --detach

.PHONY: rabbitmq/web # Opens rabbitmq web UI
rabbitmq/web:
	open http://localhost:15672
