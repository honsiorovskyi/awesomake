_RED=\033[0;31m
_GREEN=\033[0;32m
_YELLOW=\033[0;33m
_NC=\033[0m

_TRAVIS_IS_MASTER=$(shell test "$(TRAVIS_BRANCH)" = "master" -a "$(TRAVIS_EVENT_TYPE)" = "push" && echo true)
_MAKEFILE := $(firstword $(MAKEFILE_LIST))

# Prints Travis environment
.debug_ci:
	@printf "${_YELLOW}DEBUGGING INFO:\n\n"
	@env | grep TRAVIS; true
	@echo "TRAVIS_IS_MASTER=$(_TRAVIS_IS_MASTER)"
	@printf "${_NC}\n"

# Executes the target only if the build is triggered by the PR to master
.ci_if_master_%:
ifeq ($(_TRAVIS_IS_MASTER),true)
	@$(MAKE) --no-print-directory -f $(_MAKEFILE) .ci_$*
else
	@printf "${_YELLOW}- Skipping '$*' [if_master]${_NC}\n\n"
endif

# Executes the target unconditionally
.ci_%:
	@printf "${_GREEN}- Running '$*'${_NC}\n"
	@$(MAKE) --no-print-directory -f $(_MAKEFILE) $*
	@printf "\n"
