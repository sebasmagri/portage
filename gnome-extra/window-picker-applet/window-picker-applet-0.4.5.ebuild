# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="A gnome-panel applet that displays open windows as icons on the
panel"
HOMEPAGE="https://launchpad.net/window-picker-applet"
SRC_URI="http://launchpad.net/${PN}/trunk/1.0.1/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="x11-libs/gtk+:2
	x11-libs/libwnck
	gnome-base/gnome-panel
	gnome-base/gconf"
RDEPEND="${DEPEND}"

pkg_setup () {
    G2CONF="${G2CONF} \
        --disable-more-warnings \
        --localstatedir=/var \
        --with-dbus-sys=/etc/dbus-1/system.d"
}
