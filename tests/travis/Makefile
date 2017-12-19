include ../suite/suite.mk

test_master_push:
	TRAVIS_BRANCH=master \
	TRAVIS_EVENT_TYPE=push \
		make -f test_data.mk ci
	
	test -f .test/run_always.works
	test -f .test/run_master_only.works

test_master_pr:
	TRAVIS_BRANCH=master \
	TRAVIS_EVENT_TYPE=pull_request \
		make -f test_data.mk ci

	test -f .test/run_always.works
	test ! -f .test/run_master_only.works

test_custom_branch_push:
	TRAVIS_BRANCH=custom \
	TRAVIS_EVENT_TYPE=push \
		make -f test_data.mk ci
	
	test -f .test/run_always.works
	test ! -f .test/run_master_only.works

test_no_branch:	
	make -f test_data.mk ci
		
	test -f .test/run_always.works
	test ! -f .test/run_master_only.works

_cleanup:
	make -f test_data.mk _setup

_setup:
	rm -rf .test
_teardown:
_before:
	mkdir .test
_after:
	rm -rf .test