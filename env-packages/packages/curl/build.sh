PACKAGE_VERSION="7.67.0"
PACKAGE_SRCURL="https://curl.haxx.se/download/curl-${PACKAGE_VERSION}.tar.bz2"
PACKAGE_SHA256="dd5f6956821a548bf4b44f067a530ce9445cc8094fd3e7e3fc7854815858586c"
PACKAGE_DEPENDS="nghttp2, openssl, zlib"
PACKAGE_EXTRA_CONFIGURE_ARGS="
--enable-ntlm-wb=/system/bin/ntlm_auth
--with-nghttp2
--with-ssl
--with-ca-bundle=$PACKAGE_INSTALL_PREFIX/ca-certificates.pem
"

builder_step_pre_configure() {
	rm -f CMakeLists.txt
}
