# To fix error when run make in multicluster-operators-foundation repo:
# vendor/github.com/openshift/build-machinery-go/make/targets/golang/../../lib/golang.mk:23: *** `go` is required with minimal version "1.15.2", detected version "1.21.6". You can override this check by using `make GO_REQUIRED_MIN_VERSION:=`.  Stop.
set -x GO_REQUIRED_MIN_VERSION ""
