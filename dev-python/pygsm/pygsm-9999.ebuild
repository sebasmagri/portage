# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

PYTHON_DEPEND="2::2.6"

PYTHON_MODNAME="pygsm"

inherit distutils git

DESCRIPTION="Python interface to GSM modems"
HOMEPAGE="http://github.com/adammck/pygsm"
EGIT_REPO_URI="http://github.com/adammck/${PN}.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/pyserial"

RESTRICT_PYTHON_ABIS="3.*"
