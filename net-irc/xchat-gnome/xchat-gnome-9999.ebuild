# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-irc/xchat-gnome/xchat-gnome-0.26.1-r2.ebuild,v 1.2 2011/05/17 22:41:30 binki Exp $

EAPI=3
GCONF_DEBUG="yes"
PYTHON_DEPEND="python? 2"

inherit autotools eutils multilib gnome2-live python

DESCRIPTION="GNOME frontend for the popular X-Chat IRC client (Live Vanilla)"
HOMEPAGE="http://live.gnome.org/Xchat-Gnome/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~x86-fbsd"
IUSE="dbus libnotify mmx nls perl python spell ssl tcl"

RDEPEND=">=dev-libs/glib-2.18:2
	>=dev-libs/openssl-0.9.6d
	>=gnome-base/libgnome-2.16.0
	>=gnome-base/gconf-2.8.0
	>=gnome-base/libgnomeui-2.16.0
	>=gnome-base/libglade-2.3.2
	>=media-libs/libcanberra-0.3[gtk]
	>=x11-libs/gtk+-2.14:2
	>=x11-libs/libsexy-0.1.11
	x11-libs/libX11
	spell? ( app-text/enchant )
	perl? ( >=dev-lang/perl-5.6.1 )
	tcl? ( dev-lang/tcl )
	dbus? ( >=sys-apps/dbus-0.60 )
	libnotify? ( >=x11-libs/libnotify-0.3.2 )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	>=app-text/gnome-doc-utils-0.3.2
	nls? ( sys-devel/gettext )"

# gnome-base/gnome-common needed when doing eautoreconf

pkg_setup() {
	# Per configure.ac, shm is disable because of upstream bug #565958
	# --enable-shm
	G2CONF="${G2CONF}
		--enable-canberra
		--disable-schemas-install
		--disable-scrollkeeper
		--disable-static
		--disable-maintainer-mode
		$(use_enable perl)
		$(use_enable python)
		$(use_enable tcl tcl /usr/$(get_libdir))
		$(use_enable mmx)
		$(use_enable dbus)
		$(use_enable nls)
		$(use_enable libnotify notification)"

	DOCS="AUTHORS ChangeLog NEWS"

	use python && python_set_active_version 2
}

src_install() {
	gnome2_src_install

	# install plugin development header
	insinto /usr/include/xchat-gnome
	doins src/common/xchat-plugin.h || die

	# Not needed for plugins
	find "${D}" -type f -name "*.la" -delete || die "la files removal failed"
}
