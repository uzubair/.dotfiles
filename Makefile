.PHONY: install
install: cleanup
	./scripts/install.sh

.PHONY: cleanup
cleanup:
	./scripts/cleanup.sh
