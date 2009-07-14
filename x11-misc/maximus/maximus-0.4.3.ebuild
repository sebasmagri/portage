# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit gnome2

DESCRIPTION="A desktop daemon for automatically maximise and un-decorate windows"
HOMEPAGE="https://launchpad.net/maximus"
SRC_URI="http://launchpad.net/${PN}/trunk/1.0.1/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="x11-libs/gtk+:2
	x11-libs/libwnck
	x11-libs/libXtst
	x11-libs/libfakekey
	gnome-base/gconf
	gnome-base/libgnomeui
	"
RDEPEND="${DEPEND}"
