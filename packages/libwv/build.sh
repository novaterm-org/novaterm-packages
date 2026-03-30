TERMUX_PKG_HOMEPAGE=https://wvware.sourceforge.net/
TERMUX_PKG_DESCRIPTION="A library which allows access to Microsoft Word files"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.2.9
TERMUX_PKG_REVISION=6
TERMUX_PKG_SRCURL=https://github.com/AbiWord/wv/archive/refs/tags/wv-1-2-9.tar.gz
TERMUX_PKG_SHA256=effe7a2b5b81a3707c60894e7799f7c086fdec76549eb80c1e8fb835b873d2c9
TERMUX_PKG_DEPENDS="glib, libgsf, libpng, libxml2, zlib"

termux_step_pre_configure() {
	NOCONFIGURE=1 ./autogen.sh
}
