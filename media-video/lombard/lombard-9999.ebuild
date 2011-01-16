# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit subversion

DESCRIPTION="Video editor for GNOME"
HOMEPAGE="http://www.yorba.org/lombard/"
ESVN_REPO_URI="svn://svn.yorba.org/media/trunk"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-libs/libgee
		>=media-libs/gstreamer-0.10.28
		>=media-libs/gst-plugins-base-0.10.28
		x11-libs/gtk+:2"
RDEPEND="${DEPEND}
		media-libs/gnonlin"

src_configure() {
	econf \
		--disable-desktop-update \
		--disable-icon-update || die "econf failed"
}

src_compile() {
	emake lombard || die "emake lombard failed"
}

src_install() {
	emake DESTDIR="${D}" install-lombard || die "emake fillmore-install failed"
}
