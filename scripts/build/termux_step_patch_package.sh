termux_step_patch_package() {
	[ "$TERMUX_PKG_METAPACKAGE" = "true" ] && return

	cd "$TERMUX_PKG_SRCDIR"
	# Suffix patch with ".patch32" or ".patch64" to only apply for
	# these bitnesses
	local PATCHES=$(find $TERMUX_PKG_BUILDER_DIR -mindepth 1 -maxdepth 1 \
			     -name \*.patch -o -name \*.patch$TERMUX_ARCH_BITS | sort)
	local DEBUG_PATCHES=""
	if [ "$TERMUX_DEBUG_BUILD" = "true" ]; then
		DEBUG_PATCHES=$(find $TERMUX_PKG_BUILDER_DIR -mindepth 1 -maxdepth 1 -name \*.patch.debug | sort)
	fi
	local ON_DEVICE_PATCHES=""
	# .patch.ondevice patches should only be applied when building
	# on device
	if [ "$TERMUX_ON_DEVICE_BUILD" = "true" ]; then
		ON_DEVICE_PATCHES=$(find $TERMUX_PKG_BUILDER_DIR -mindepth 1 -maxdepth 1 -name \*.patch.ondevice | sort)
	fi

}
