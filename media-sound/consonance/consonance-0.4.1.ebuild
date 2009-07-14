# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

DESCRIPTION="A lightweight music manager"
HOMEPAGE="https://sites.google.com/site/consonancemanager/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="modplug"

DEPEND="dev-libs/dbus-glib
	dev-db/sqlite:3
	media-libs/flac
	media-libs/libao
	media-libs/libmad
	media-libs/libsndfile
	media-libs/libvorbis
	modplug? ( media-libs/libmodplug )
	media-libs/taglib
	x11-libs/gtk+:2
	x11-libs/libnotify"
RDEPEND="${DEPEND}"

src_compile() {
	econf \
	$(use_enable modplug ) \
	|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install  || die "emake install failed"
}
