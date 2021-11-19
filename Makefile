.PHONY: install
install: cleanup
	./scripts/install.sh

.PHONY:
cleanup:
	./scripts/cleanup.sh
