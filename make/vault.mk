.PHONY: vault/kill # Kills vault container
vault/kill:
	docker compose kill vault

.PHONY: vault/logs # Shows vault container logs
vault/logs:
	docker compose logs --follow --since 10m vault

.PHONY: vault/nuke # Kills vault container and removes volumes
vault/nuke: vault/kill vault/rm vault/rmi

.PHONY: vault/reset # Complete reset of vault container
vault/reset: vault/nuke vault/up

.PHONY: vault/restart # Restarts vault container
vault/restart: vault/kill vault/up

.PHONY: vault/rm # Removes vault container
vault/rm:
	docker compose rm vault --force

.PHONY: vault/rmi # Removes vault image
vault/rmi:
	docker rmi --force hashicorp/vault:latest

.PHONY: vault/up # Run vault containers
vault/up:
	docker compose up vault --detach

.PHONY: vault/web # Opens vault web UI
vault/web:
	open http://localhost:8200
