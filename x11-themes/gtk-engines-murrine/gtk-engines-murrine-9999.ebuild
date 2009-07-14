# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils subversion autotools

MY_PN="murrine"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="Murrine GTK+2 Cairo Engine"

HOMEPAGE="http://www.cimitan.com/murrine/"
URI_PREFIX="http://cimi.netsons.org/media/download_gallery"
SRC_URI="${URI_PREFIX}/MurrinaFancyCandy.tar.bz2 ${URI_PREFIX}/MurrinaVerdeOlivo.tar.bz2 ${URI_PREFIX}/MurrinaGilouche.tar.bz2 ${URI_PREFIX}/MurrinaLoveGray.tar.bz2 ${URI_PREFIX}/MurrineThemePack.tar.bz2 ${URI_PREFIX}/MurrineXfwm.tar.bz2 http://www.kernow-webhosting.com/~bvc/theme/mcity/Murrine.tar.gz"

ESVN_REPO_URI="http://svn.gnome.org/svn/murrine/trunk/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND=">=x11-libs/gtk+-2.8"
DEPEND="${RDEPEND}
		dev-util/pkgconfig
		>=dev-util/intltool-0.37.1"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	subversion_src_unpack
	cd "$S"

	# For reasons unknown to me _elibtoolize won't create the necessary ltmain.sh
	# file, running autoconf --trace=AM_PROG_LIBTOOL will show that it was called,
	# but won't create it either.
	# If you know how to fix this please let me know (usr.gentoo@gmail.com).
	# Thanks, Geralt.
	libtoolize --force --copy || die "libtoolize failed"
	intltoolize --force --copy --automake || die "intltoolize failed"

	eaclocal || die "eaclocal failed"
	eautoconf || die "autoconf failed"
	eautoheader || die "eautoheader failed"
	eautomake || die "eautomake failed"
}

src_compile() {
	econf --enable-animation --prefix=/usr || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog CREDITS
}
