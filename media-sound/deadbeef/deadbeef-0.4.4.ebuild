# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit fdo-mime

DESCRIPTION="foobar2000-like music player."
HOMEPAGE="http://deadbeef.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
LICENSE="LGPL-2.1 MIT" # TODO incomplete!

# License details:
# ./md5/ - MIT
# TODO

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="aac adplug alsa audiooverload cdda cover curl dbus dts
	dumb ffap ffmpeg flac gme gtk +hotkeys lastfm midi mms mp3
	musepack nullout oss pulseaudio shellexec shorten sid
	sndfile +supereq tta vorbis vtx wavpack"

RDEPEND="
	media-libs/libsamplerate
	alsa? ( media-libs/alsa-lib )
	cover? ( net-misc/curl )
	cdda? ( dev-libs/libcdio media-libs/libcddb )
	curl? ( net-misc/curl )
	dbus? ( sys-apps/dbus )
	ffmpeg? ( media-video/ffmpeg )
	flac? ( media-libs/flac )
	gtk? ( x11-libs/gtk+:2 )
	lastfm? ( net-misc/curl )
	mms? ( media-libs/libmms )
	mp3? ( media-libs/libmad )
	pulseaudio? ( media-sound/pulseaudio )
	sndfile? ( media-libs/libsndfile )
	wavpack? ( media-sound/wavpack )
"
DEPEND="${RDEPEND}"

src_prepare() {
	# Removing bundle dependencies
	:
	# TODO:
	# plugins/aac: aac? ( media-libs/faad2 )
	# plugins/adplug: adplug? ( media-libs/adplug )
	# plugins/ao
	# plugins/dca: dts? ( media-libs/libdca )
	# plugins/dump
	# plugins/gme
	# plugins/musepack: musepack? ( media-sound/musepack-tools )
	# plugins/shn: shorten? ( media-sound/shorten )
	# plugins/sid? ( media-libs/libsidplay )
	# plugins/supereq
	# plugins/tta
	# plugins/vorbis: vorbis? ( media-libs/libvorbis )
	# plugins/vtx
	# plugins/wildmidi: midi? ( media-sound/wildmidi )
}

src_configure() {
	my_config="
		--disable-dependency-tracking \
		$(use_enable aac) \
		$(use_enable adplug) \
		$(use_enable alsa) \
		$(use_enable audiooverload ao) \
		$(use_enable cdda) \
		$(use_enable dbus notify) \
		$(use_enable dts dca) \
		$(use_enable dumb) \
		$(use_enable ffap) \
		$(use_enable ffmpeg) \
		$(use_enable flac) \
		$(use_enable gme) \
		$(use_enable gtk gtkui) \
		--disable-gtk3 \
		$(use_enable hotkeys) \
		$(use_enable lastfm lfm) \
		$(use_enable mp3 mad) \
		$(use_enable midi wildmidi) \
		$(use_enable musepack) \
		$(use_enable nullout) \
		$(use_enable oss) \
		$(use_enable pulseaudio pulse) \
		$(use_enable shellexec)
		$(use_enable shorten shn) \
		$(use_enable sid) \
		$(use_enable sndfile) \
		$(use_enable supereq) \
		$(use_enable tta) \
		$(use_enable vorbis) \
		$(use_enable vtx) \
		$(use_enable wavpack) \
	"

	if use cover ; then
		# artwork need vfs-curl plugin, we force it
		my_config="${my_config} \
			--enable-vfs-curl \
			--enable-artwork"
	else
		my_config="${my_config} \
			$(use_enable curl vfs-curl) \
			--disable-artwork"
	fi

	econf ${my_config} || die
}

src_install() {
	make DESTDIR="${D}" install || die
}
