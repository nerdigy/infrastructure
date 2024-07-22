.PHONY: docker/kill # Kill all docker containers
docker/kill:
	docker compose kill

.PHONY: docker/nuke # Remove all docker containers, images, networks, and volumes
docker/nuke: docker/kill
	docker compose down --rmi all --volumes --remove-orphans

.PHONY: docker/prune # Prune docker system & volumes
docker/prune:
	docker system prune --force
	docker volume prune --force

.PHONY: docker/rm # Remove all docker containers
docker/rm:
	docker compose rm --force

.PHONY: docker/up # Run docker containers
docker/up:
	docker compose up --detach
