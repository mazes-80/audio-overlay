# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="Third party plugins for SuperCollider"
HOMEPAGE="https://github.com/supercollider/sc3-plugins"
EGIT_REPO_URI="https://github.com/supercollider/sc3-plugins.git"
if [[ ${PV} == *9999 ]]; then
	KEYWORDS=""
else
	EGIT_COMMIT="Version-${PV}"
	KEYWORDS="~amd64"
fi
LICENSE="GPL-2"
SLOT="0"

IUSE=""
RESTRICT="mirror"

RDEPEND="
	media-sound/supercollider
"
DEPEND="${RDEPEND}
"

src_configure() {
	local mycmakeargs=(
		-DSC_PATH=/usr/include/SuperCollider
		-DAY=ON
		-DSUPERNOVA=ON
	)

	cmake-utils_src_configure
}
