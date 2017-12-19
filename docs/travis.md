# Travis extensions

This package facilitates the replacement or extension of the Travis default pipeline
with the Makefile-base ones.

This extension provides two extra prefixes for your targets:
- `.ci_` — used for the targets that should be executed uncoditionally,
- `.ci_if_master_` — used for the targets that should be executed only on the push to the `master` branch of the repo.

Also you can specify as a dependency (or run directly) the target `.debug_ci` which prints all the Travis-related environment variables.

## Example

Makefile:

```make
include travis.mk

test:
	@echo run tests

build:
	@echo build some binaries

package:
	@echo create a tarball [only for master commits]

deploy:
	@echo deploy somewhere [only for master commits]

ci: .ci_test .ci_build .ci_if_master_package .ci_if_master_deploy
```

Output for arbitrary branch:
```
$ TRAVIS_BRANCH=some_branch TRAVIS_EVENT_TYPE=push make ci

- Running 'test'
run tests

- Running 'build'
build some binaries

- Skipping 'package' [if_master]

- Skipping 'deploy' [if_master]

```

Output for master branch:
```
$ TRAVIS_BRANCH=master TRAVIS_EVENT_TYPE=push make ci
- Running 'test'
run tests

- Running 'build'
build some binaries

- Running 'package'
create a tarball [only for master commits]

- Running 'deploy'
deploy somewhere [only for master commits]
```
