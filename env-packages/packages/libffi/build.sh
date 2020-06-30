PACKAGE_VERSION="3.2.1"
PACKAGE_SRCURL="ftp://sourceware.org/pub/libffi/libffi-${PACKAGE_VERSION}.tar.gz"
PACKAGE_SHA256="d06ebb8e1d9a22d19e38d63fdb83954253f39bedc5d46232a05645685722ca37"
PACKAGE_EXTRA_CONFIGURE_ARGS="--disable-multi-os-directory"

builder_step_pre_configure() {
	if [ "$PACKAGE_TARGET_ARCH" = "arm" ]; then
		CFLAGS+=" -fno-integrated-as"
	fi
	autoconf
}

builder_step_post_configure() {
	# Work around since mmap can't be written and marked
	# executable in android anymore from userspace.
	echo "#define FFI_MMAP_EXEC_WRIT 1" >> fficonfig.h
}
