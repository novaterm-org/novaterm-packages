TERMUX_PKG_HOMEPAGE=https://dianne.skoll.ca/projects/rp-pppoe/
TERMUX_PKG_DESCRIPTION="A PPP-over-Ethernet redirector for pppd"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=4.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://dianne.skoll.ca/projects/rp-pppoe/download.php?file=rp-pppoe-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=1d3f66dd28526d05f1ca53e8b8bf877cd58e03c2be9028c061bf2b4d9a4e83c7
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--disable-static
"

termux_step_pre_configure() {
	TERMUX_PKG_SRCDIR=$TERMUX_PKG_SRCDIR/src
	TERMUX_PKG_BUILDDIR=$TERMUX_PKG_SRCDIR
}
