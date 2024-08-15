#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/android-vnc-viewer
DATA_DIR=$(DESTDIR)$(PREFIX)/share/android-vnc-viewer
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard android-vnc-viewer/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-android-vnc-viewer install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-android-vnc-viewer:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 android-vnc-viewer/android-vnc-viewer "$(BIN_DIR)"

.PHONY: check install install-doc install-android-vnc-viewer shellcheck
