PACKAGE_VERSION="0.38.4"
PACKAGE_SRCURL="https://cairographics.org/releases/pixman-${PACKAGE_VERSION}.tar.gz"
PACKAGE_SHA256="da66d6fd6e40aee70f7bd02e4f8f76fc3f006ec879d346bae6a723025cfbdde7"
PACKAGE_DEPENDS="libandroid-cpufeatures, libpng"

PACKAGE_EXTRA_CONFIGURE_ARGS="
--disable-loongson-mmi
--disable-vmx
--disable-arm-iwmmxt
--disable-arm-iwmmxt2
"

builder_step_pre_configure() {
	export LIBS="-landroid-cpufeatures"

	if [ "$PACKAGE_TARGET_ARCH" = "arm" ]; then
		CFLAGS+=" -fno-integrated-as"
		PACKAGE_EXTRA_CONFIGURE_ARGS+=" --enable-arm-simd"
		PACKAGE_EXTRA_CONFIGURE_ARGS+=" --enable-arm-neon"
	elif [ "$PACKAGE_TARGET_ARCH" = "i686" ] || [ "$PACKAGE_TARGET_ARCH" = "x86_64" ]; then
		PACKAGE_EXTRA_CONFIGURE_ARGS+=" --enable-mmx"
		PACKAGE_EXTRA_CONFIGURE_ARGS+=" --enable-sse2"
		PACKAGE_EXTRA_CONFIGURE_ARGS+=" --enable-ssse3"
	fi
}
