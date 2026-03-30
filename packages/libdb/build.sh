TERMUX_PKG_HOMEPAGE=https://www.oracle.com/database/berkeley-db
TERMUX_PKG_DESCRIPTION="The Berkeley DB embedded database system (library)"
TERMUX_PKG_LICENSE="AGPL-V3"
# We override TERMUX_PKG_SRCDIR termux_step_pre_configure so need to do
# this hack to be able to find the license file.
TERMUX_PKG_LICENSE_FILE="../LICENSE"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=18.1.40
TERMUX_PKG_REVISION=5
TERMUX_PKG_SRCURL=https://github.com/yasuhirokimura/db18/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=f237a63b63c260bcc5fc7ba854c5ba898b5fa2806952da18d9262335de8fb1ae
TERMUX_PKG_DEPENDS="libc++"
TERMUX_PKG_BREAKS="libdb-dev"
TERMUX_PKG_REPLACES="libdb-dev"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--enable-hash
--enable-smallbuild
--enable-compat185
db_cv_atomic=gcc-builtin
--enable-cxx
"

termux_step_pre_configure() {
	TERMUX_PKG_SRCDIR=$TERMUX_PKG_SRCDIR/dist

	LDFLAGS+=" $($CC -print-libgcc-file-name)"
}
