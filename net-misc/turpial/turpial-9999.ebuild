# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_6 python2_7 )

inherit distutils-r1 git-r3

DESCRIPTION="Lightweigth and featurefull microblogging client"
HOMEPAGE="http://turpial.org.ve/"
EGIT_REPO_URI="https://github.com/satanas/Turpial.git"
EGIT_BRANCH="development"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="qt4"

DEPEND=">=dev-python/Babel-1.3
	>=dev-python/setuptools-0.8-r1"

RDEPEND=">=dev-python/notify-python-0.1.1-r3
	>=media-libs/gst-plugins-base-1.2.3
	>=net-libs/libturpial-1.7.0
	qt4? ( >=dev-python/PyQt4-4.10.2 )"
