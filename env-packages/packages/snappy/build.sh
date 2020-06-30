PACKAGE_VERSION="1.1.7"
PACKAGE_SRCURL="https://github.com/google/snappy/archive/${PACKAGE_VERSION}.tar.gz"
PACKAGE_SHA256="3dfa02e873ff51a11ee02b9ca391807f0c8ea0529a4924afa645fbf97163f9d4"

builder_step_post_make_install() {
	mkdir -p "$PACKAGE_INSTALL_PREFIX/lib/pkgconfig"
	sed "s|@PACKAGE_PREFIX@|$PACKAGE_INSTALL_PREFIX|g" \
		"$PACKAGE_BUILDER_DIR/snappy.pc.in" \
		> "$PACKAGE_INSTALL_PREFIX/lib/pkgconfig/snappy.pc"
}
