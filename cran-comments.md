Dear CRAN Maintainers,

As requested, this makes the tests run on CRAN less fragile, avoiding possible errors when the external resource accessed by several of the tests goes down. This should also shorten th run-time of the tests you observe. (The longer-running tests against the external resource will still be run nightly by me on the package development version, but will not impact CRAN).

Sincerely,

Carl Boettiger
