#!/usr/bin/make
#
# pmver - determine the version of a perl module
#
# @(#) $Revision: 1.2 $
# @(#) $Id: Makefile,v 1.2 2002/01/21 05:49:16 chongo Exp chongo $
# @(#) $Source: /usr/local/src/bin/pmver/RCS/Makefile,v $
#
# Copyright (c) 1999 by Landon Curt Noll.  All Rights Reserved.
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
DESTDIR=/usr/local/bin
INSTALL=install
TARGETS= pmver

# remote operations
#
THISDIR= pmver
RSRCPSH= rsrcpush
RMAKE= rmake

all: ${TARGETS}

install: all
	${INSTALL} -c -m ${BINMODE} ${TARGETS} ${DESTDIR}

clean:

clobber: clean

# push source to remote sites
#
pushsrc: all
	${RSRCPSH} -v -x . ${THISDIR}

pushsrcq: all
	@${RSRCPSH} -q . ${THISDIR}

pushsrcn: all
	${RSRCPSH} -v -x -n . ${THISDIR}

# run make on remote hosts
#
rmtall:
	${RMAKE} ${THISDIR} all

rmtinstall:
	${RMAKE} ${THISDIR} install

rmtclean:
	${RMAKE} ${THISDIR} clean

rmtclobber:
	${RMAKE} ${THISDIR} clobber
