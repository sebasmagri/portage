# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit fdo-mime

DESCRIPTION="XDG compliant Gentoo specific menus"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI="http://sebasmagri.blinkenshell.org/gentoove/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="binchecks strip"

RDEPEND="x11-misc/xdg-utils"

src_install() {
	insinto /usr/share/applications/
	doins "${WORKDIR}"/*.desktop
	insinto /usr/share/desktop-directories/
	doins "${WORKDIR}"/Gentoo.directory
	insinto /usr/share/pixmaps/
	doins "${WORKDIR}"/gentoo-logo.png
}

pkg_postinst() {
	xdg-desktop-menu install --novendor	${ROOT}/usr/share/desktop-directories/Gentoo.directory ${ROOT}/usr/share/applications/Gentoo-*.desktop
}
