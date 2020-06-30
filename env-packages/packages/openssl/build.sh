PACKAGE_VERSION="1.1.1d"
PACKAGE_SRCURL="https://www.openssl.org/source/openssl-${PACKAGE_VERSION/\~/-}.tar.gz"
PACKAGE_SHA256="1e3a91bc1f9dfce01af26026f856e064eab4c8ee0a8f457b5ae30b40b8b711f2"
PACKAGE_BUILD_IN_SRC="true"

builder_step_configure() {
	CFLAGS+=" -DNO_SYSLOG"
	if [ "$PACKAGE_TARGET_ARCH" = "arm" ]; then
		CFLAGS+=" -fno-integrated-as"
	fi

	perl -p -i -e "s@TERMUX_CFLAGS@$CFLAGS@g" Configure

	rm -rf "$PACKAGE_INSTALL_PREFIX"/lib/libcrypto.*
	rm -rf "$PACKAGE_INSTALL_PREFIX"/lib/libssl.*

	test "$PACKAGE_TARGET_ARCH" = "arm" && TERMUX_OPENSSL_PLATFORM="android-arm"
	test "$PACKAGE_TARGET_ARCH" = "aarch64" && TERMUX_OPENSSL_PLATFORM="android-arm64"
	test "$PACKAGE_TARGET_ARCH" = "i686" && TERMUX_OPENSSL_PLATFORM="android-x86"
	test "$PACKAGE_TARGET_ARCH" = "x86_64" && TERMUX_OPENSSL_PLATFORM="android-x86_64"

	./Configure "$TERMUX_OPENSSL_PLATFORM" \
		--prefix="$PACKAGE_INSTALL_PREFIX" \
		--openssldir="$PACKAGE_INSTALL_PREFIX" \
		no-shared \
		no-ssl \
		no-comp \
		no-dso \
		no-hw \
		no-engine \
		no-srp \
		no-tests
}

builder_step_make() {
	make depend
	make -j "$CONFIG_BUILDER_MAKE_PROCESSES" all
}
