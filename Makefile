.PHONY: setup
setup:
	./dist/setup.sh

.PHONY: install
install: cleanup
	./dist/install.sh

.PHONY:
cleanup:
	./dist/cleanup.sh
