_RED=\033[0;31m
_GREEN=\033[0;32m
_YELLOW=\033[0;33m
_NC=\033[0m

MAKEFILE := $(firstword $(MAKEFILE_LIST))
TESTS=$(shell cat $(MAKEFILE) | grep -E '^test_\w+:' | awk -F: '{ print ".test_"$$1 }')

.test_%:
	@printf '$(_GREEN)'
	@printf '================================================================================\n'
	@printf 'Test: $*\n'
	@printf '================================================================================\n'
	@printf '$(_NC)'
	@make -f $(MAKEFILE) _before
	@make -f $(MAKEFILE) $*
	@make -f $(MAKEFILE) _after

.info:
	@printf "$(_GREEN)Running tests from '$(MAKEFILE)$(_NC)\n\n"

all: _setup .info $(TESTS) _teardown
	@printf "\n$(_GREEN)All tests successfully passed!$(_NC)\n"
