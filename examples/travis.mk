#
# Run this with
# 
#    TRAVIS_BRANCH=some_branch TRAVIS_EVENT_TYPE=push make -f travis1.mk ci
#
# or
#
#    TRAVIS_BRANCH=master TRAVIS_EVENT_TYPE=push make -f travis1.mk ci
#

include ../travis.mk

test:
	@echo run tests

build:
	@echo build some binaries

package:
	@echo create a tarball [only for master commits]

deploy:
	@echo deploy somewhere [only for master commits]

ci: .ci_test .ci_build .ci_if_master_package .ci_if_master_deploy

