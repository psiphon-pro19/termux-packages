TERMUX_PKG_HOMEPAGE=https://github.com/pocketbase/pocketbase
TERMUX_PKG_DESCRIPTION="An open source Go backend"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.23.10"
TERMUX_PKG_SRCURL="https://github.com/pocketbase/pocketbase/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256=bccf682330f046027cb96329b418e48a0cba5f4386c5d643a57f53a10293c5d7
TERMUX_PKG_DEPENDS="resolv-conf"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make() {
	termux_setup_golang

	mkdir ./gopath
	export GOPATH="$PWD/gopath"

	cd $TERMUX_PKG_SRCDIR/examples/base

	export GOBUILD=CGO_ENABLED=0

	go build \
		-trimpath \
		-o "pocketbase.bin" \
		main.go
}

termux_step_make_install() {
	install -m700 examples/base/pocketbase.bin "${TERMUX_PREFIX}"/bin/pocketbase
}
