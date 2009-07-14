# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit toolchain-funcs

MY_P="${PN}_${PV}_source"
MY_SHAREDIR="/usr/share/${PN}/"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="The usable image editor"
HOMEPAGE="http://www.nathive.org"
SRC_URI="http://${PN}.org/packages/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/glib
	x11-libs/gtk+:2
	dev-util/pkgconfig"
RDEPEND="${DEPEND}"

src_prepare(){
	#cd "${S}"

	#Change the path where the app search for its configuration and shared files
	sed -i -e "s:#define PATH .*:#define PATH \"${MY_SHAREDIR}\":g" main.c || die

	# Set the default locale to English in the config file. If not set causes a
	# segfault at startup
	sed -i 's/auto/english/g' cfg/cfg.xml || die
}

src_compile(){
	CFLAGS="${CFLAGS} $(pkg-config --cflags gtk+-2.0)"
	LIBS="$(pkg-config --libs gtk+-2.0)"
	$(tc-getCC) ${CFLAGS} ${LDFLAGS} -o ${PN} main.c ${LIBS} || die "compile failed"
}

src_install(){
	dobin ${PN}
	insinto ${MY_SHAREDIR}/cfg
	doins cfg/*
	insinto ${MY_SHAREDIR}/img
	doins img/*
	insinto ${MY_SHAREDIR}/palettes
	doins palettes/*
	insinto ${MY_SHAREDIR}/lang
	doins lang/*
	dodoc text/credits || die
}

pkg_postinst(){
	einfo "You can set a Language different than English in"
	einfo "/usr/share/nathive/cfg/cfg.xml with a value available"
	einfo "in /usr/share/nathive/lang/"
	einfo "GUI is by default in English"
}
