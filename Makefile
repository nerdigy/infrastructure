default: help

include make/*.mk

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@echo ""
	@cat $(MAKEFILE_LIST) | grep "^\.PHONY" | grep -E "\/help" | sed 's/\.PHONY: //' | sed 's/#/\t/g' | column -t -s $$'\t' | sort -b
	@echo ""
	@echo "To see help for a specific target, run:"
	@echo ""
	@echo "make [target]/help"
	@echo ""
	@echo "To setup the project, run:"
	@echo ""
	@echo "make setup"

.PHONY: setup # Launch all docker containers
setup: docker/up

.PHONY: docker/help # Show help for docker targets
docker/help:
	@make help-for section=docker

.PHONY: mysql/help # Show help for mysql targets
mysql/help:
	@make help-for section=mysql

.PHONY: postgres/help # Show help for postgres targets
postgres/help:
	@make help-for section=postgres

.PHONY: rabbitmq/help # Show help for rabbitmq targets
rabbitmq/help:
	@make help-for section=rabbitmq

.PHONY: redis/help # Show help for redis targets
redis/help:
	@make help-for section=redis

.PHONY: sqlserver/help # Show help for sqlserver targets
sqlserver/help:
	@make help-for section=sqlserver

.PHONY: vault/help # Show help for vault targets
vault/help:
	@make help-for section=vault

.PHONY: eventstore/help # Show help for eventstore targets
eventstore/help:
	@make help-for section=eventstore

help-for:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets for $(section):"
	@echo ""
	@cat $(MAKEFILE_LIST) | grep "^\.PHONY" | grep "$(section)\/" | sed 's/\.PHONY: //' | sed 's/#/\t/g' | column -t -s $$'\t' | sort -b
