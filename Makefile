#!/usr/bin/make
#
# pmver - determine the version of a perl module
#
# @(#) $Revision: 1.8 $
# @(#) $Id: Makefile,v 1.8 2014/03/15 23:45:49 root Exp root $
# @(#) $Source: /usr/local/src/bin/pmver/RCS/Makefile,v $
#
# Copyright (c) 1999-2013 by Landon Curt Noll.  All Rights Reserved.
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby granted,
# provided that the above copyright, this permission notice and text
# this comment, and the disclaimer below appear in all of the following:
#
#       supporting documentation
#       source copies
#       source works derived from this source
#       binaries derived from this source or from derived source
#
# LANDON CURT NOLL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
# INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO
# EVENT SHALL LANDON CURT NOLL BE LIABLE FOR ANY SPECIAL, INDIRECT OR
# CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
# USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

SHELL=/bin/sh
BINMODE=0555
DESTBIN=/usr/local/bin
INSTALL=install
TARGETS= pmver

# remote operations
#
THISDIR= pmver
RSRCPSH= rsrcpush
RMAKE= rmake

all: ${TARGETS}

install: all
	${INSTALL} -c -m ${BINMODE} ${TARGETS} ${DESTBIN}

clean:

clobber: clean

# help
#
help:
	@echo make install
	@echo
	@echo make pushsrc
	@echo make pushsrcn
	@echo
	@echo make rmtinstall
	@echo
	@echo make univ

# push source to remote sites
#
pushsrc:
	${RSRCPSH} -v -x . ${THISDIR}

pushsrcq:
	@${RSRCPSH} -q . ${THISDIR}

pushsrcn:
	${RSRCPSH} -v -x -n . ${THISDIR}

# run make on remote hosts
#
rmtall:
	${RMAKE} -v ${THISDIR} all

rmtinstall:
	${RMAKE} -v ${THISDIR} install

rmtclean:
	${RMAKE} -v ${THISDIR} clean

rmtclobber:
	${RMAKE} -v ${THISDIR} clobber

# build, install, and cleanup everywhere
#
univ: install pushsrc rmtinstall
