include ../../travis.mk

default:
	touch .test/default.works

run_always:
	touch .test/run_always.works

run_master_only:
	touch .test/run_master_only.works

ci: .debug_ci \
	.ci_run_always \
	.ci_if_master_run_master_only
