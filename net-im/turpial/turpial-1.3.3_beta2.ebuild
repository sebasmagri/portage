# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

PYTHON_DEPEND="2::2.6"

PYTHON_MODNAME="turpial"

inherit distutils

MY_PV="${PV:0:5}-b2"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Lightweigth and featurefull microblogging client"
HOMEPAGE="http://turpial.org.ve/"
SRC_URI="http://forja.softwarelibre.gob.ve/frs/download.php/198/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-python/Babel
	dev-python/setuptools"

RDEPEND="${DEPEND}
	dev-python/gtkspell-python
	dev-python/notify-python
	dev-python/pygame
	dev-python/pygtk
	dev-python/pywebkitgtk
	dev-python/simplejson"

S=${WORKDIR}/${MY_P}

RESTRICT_PYTHON_ABIS="3.*"
