# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_6 python2_7 )

inherit distutils-r1 git-r3

DESCRIPTION="A Python library to handle microblogging protocols"
HOMEPAGE="http://turpial.org.ve/"
EGIT_REPO_URI="https://github.com/sebasmagri/libturpial.git"
EGIT_BRANCH="do-not-install-tests"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
	>=dev-python/requests-2.0.0
	>=dev-python/oauth-1.0.1
	>=dev-python/simplejson-3.3.1"
