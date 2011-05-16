# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2::2.6"

PYTHON_MODNAME="turpial"

SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Lightweigth and featurefull microblogging client"
HOMEPAGE="http://turpial.org.ve/"
SRC_URI="http://turpial.org.ve/files/sources/stable/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/Babel
	dev-python/setuptools"

RDEPEND="${DEPEND}
	dev-python/gtkspell-python
	dev-python/notify-python
	dev-python/pygtk
	dev-python/simplejson
	media-libs/gst-plugins-base"

RESTRICT_PYTHON_ABIS="2.[45] 3.*"
