PACKAGE_VERSION="1.40.0"
PACKAGE_SRCURL="https://github.com/nghttp2/nghttp2/releases/download/v${PACKAGE_VERSION}/nghttp2-${PACKAGE_VERSION}.tar.xz"
PACKAGE_SHA256="09fc43d428ff237138733c737b29fb1a7e49d49de06d2edbed3bc4cdcee69073"
PACKAGE_EXTRA_CONFIGURE_ARGS="--enable-lib-only"
PACKAGE_DEPENDS="openssl"

builder_step_pre_configure() {
	rm -f CMakeLists.txt
}
