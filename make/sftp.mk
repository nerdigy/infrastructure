.PHONY: sftp/kill # Kills sftp container
sftp/kill:
	docker compose kill sftp

.PHONY: sftp/logs # Shows sftp container logs
sftp/logs:
	docker compose logs --follow --since 1m sftp

.PHONY: sftp/nuke # Kills sftp container and removes volumes
sftp/nuke: sftp/kill sftp/rm sftp/rmi

.PHONY: sftp/reset # Complete reset of sftp container
sftp/reset: sftp/nuke sftp/up

.PHONY: sftp/restart # Restarts sftp container
sftp/restart: sftp/kill sftp/up

.PHONY: sftp/rm # Removes sftp container
sftp/rm:
	docker compose rm sftp --force

.PHONY: sftp/rmi # Removes sftp image
sftp/rmi:
	docker rmi --force atomz/sftp:latest

.PHONY: sftp/up # Run sftp containers
sftp/up:
	docker compose up sftp --detach
