.PHONY: sqlserver/kill # Kills sqlserver container
sqlserver/kill:
	docker compose kill sqlserver

.PHONY: sqlserver/logs # Shows sqlserver container logs
sqlserver/logs:
	docker compose logs --follow --since 5m sqlserver

.PHONY: sqlserver/nuke # Kills sqlserver container and removes volumes
sqlserver/nuke: sqlserver/kill
	docker compose rm sqlserver --force --volumes

.PHONY: sqlserver/reset # Complete reset of sqlserver container
sqlserver/reset: sqlserver/nuke sqlserver/up

.PHONY: sqlserver/restart # Restarts sqlserver container
sqlserver/restart: sqlserver/kill sqlserver/up

.PHONY: sqlserver/rm # Removes sqlserver container
sqlserver/rm:
	docker compose rm sqlserver --force

.PHONY: sqlserver/up # Run sqlserver containers
sqlserver/up:
	docker compose up sqlserver --detach
