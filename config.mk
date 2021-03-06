# uwp version
VERSION = 0.0.1

# Customize the below to fit your system
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

PKG_CONFIG = pkg-config

# libcurl
CURLINC = /usr/include/curl
CURLLIB = `$(PKG_CONFIG) --libs libcurl`

# md4c (markdown to HTML)
MD4CLIB = `$(PKG_CONFIG) --libs md4c-html`

# comment out if on *BSD
BSDLIB = -lbsd

INCS = -I$(CURLINC)
LIBS = -lm -lrt -lutil \
       $(CURLLIB) \
       $(MD4CLIB) \
       $(BSDLIB)

UCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=600
UCFLAGS   = $(INCS) $(UCPPFLAGS) $(CFLAGS)
ULDFLAGS  = $(LIBS) $(LDFLAGS)
FLAGS     = $(UCFLAGS) $(ULDFLAGS)
