################################################################################
#
# xdp-tools
#
################################################################################

XDP_TOOLS_VERSION = 1.5.5
XDP_TOOLS_SITE = $(call github,xdp-project,xdp-tools,v$(XDP_TOOLS_VERSION))

XDP_TOOLS_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
XDP_TOOLS_LICENSE_FILES = LICENSE \
	LICENSES/BSD-2-Clause LICENSES/GPL-2.0 LICENSES/LGPL-2.1

# TODO: is this correct or do they belong to libxdp
XDP_TOOLS_DEPENDENCIES = zlib host-pkgconf elfutils libpcap libcap-ng host-clang

# # Remove parallel compilation
# XDP_TOOLS_MAKE = $(MAKE1)

# # Verbose mode
# XDP_TOOLS_MAKE_OPTS = V=1

# XDP_TOOLS_CFLAGS = -Wno-error

# XDP_TOOLS_MAKE_OPTS += BPF_CFLAGS="-Wall -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -Wno-visibility -fno-stack-protector -DBPF_DIR_MNT=\"/sys/fs/bpf\" -DBPF_OBJECT_PATH=\"/usr/local/lib/bpf\" -DMAX_DISPATCHER_ACTIONS=10 -DTOOLS_VERSION=\""1.5.5"\" -DLIBBPF_VERSION=\"1.5.0\" -DRUNDIR=\"/run\" -DHAVE_BPFTOOL -DHAVE_LIBBPF_PERF_BUFFER__CONSUME -DHAVE_LIBBPF_BTF__LOAD_FROM_KERNEL_BY_ID -DHAVE_LIBBPF_BTF__TYPE_CNT -DHAVE_LIBBPF_BPF_OBJECT__NEXT_MAP -DHAVE_LIBBPF_BPF_OBJECT__NEXT_PROGRAM -DHAVE_LIBBPF_BPF_PROGRAM__INSN_CNT -DHAVE_LIBBPF_BPF_PROGRAM__TYPE -DHAVE_LIBBPF_BPF_PROGRAM__FLAGS -DHAVE_LIBBPF_BPF_PROGRAM__EXPECTED_ATTACH_TYPE -DHAVE_LIBBPF_BPF_MAP_CREATE -DHAVE_LIBBPF_PERF_BUFFER__NEW_RAW -DHAVE_LIBBPF_BPF_XDP_ATTACH -DHAVE_LIBBPF_BPF_MAP__SET_AUTOCREATE -DHAVE_LIBBPF_BPF_PROG_TEST_RUN_OPTS -DHAVE_LIBBPF_BPF_XDP_QUERY -DHAVE_SECURE_GETENV -DDEBUG -DLIBBPF_DYNAMIC -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -I../../headers  -I../../headers"

# TODO: configure says it needs libelf -> package elfutils or package host-elfutils?

define XDP_TOOLS_CONFIGURE_CMDS
	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure $(XDP_TOOLS_CONF_OPTS)
endef

define XDP_TOOLS_BUILD_CMDS
	$(MAKE1) -C $(@D) V=1 all
endef

$(eval $(generic-package))
