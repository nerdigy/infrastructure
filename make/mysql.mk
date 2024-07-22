.PHONY: mysql/kill # Kills mysql container
mysql/kill:
	docker compose kill mysql

.PHONY: mysql/logs # Shows mysql container logs
mysql/logs:
	docker compose logs --follow --since 10m mysql

.PHONY: mysql/nuke # Kills mysql container and removes volumes
mysql/nuke: mysql/kill mysql/rm mysql/rmi

.PHONY: mysql/reset # Complete reset of mysql container
mysql/reset: mysql/nuke mysql/up

.PHONY: mysql/restart # Restarts mysql container
mysql/restart: mysql/kill mysql/up

.PHONY: mysql/rm # Removes mysql container
mysql/rm:
	docker compose rm mysql --force

.PHONY: mysql/rmi # Removes mysql container
mysql/rmi:
	docker rmi mysql:8 --force

.PHONY: mysql/up # Run mysql containers
mysql/up:
	docker compose up mysql --detach
