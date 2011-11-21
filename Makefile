# New ports collection makefile for:	i3status
# Date created:			07 Nov 2011
# Whom:				Tobias Rehbein <tobias.rehbein@web.de>
#
# $FreeBSD$

PORTNAME=	i3status
PORTVERSION=	2.3
CATEGORIES=	x11
MASTER_SITES=	http://i3wm.org/i3status/

MAINTAINER=	tobias.rehbein@web.de
COMMENT=	Generates a status bar for dzen2, xmobar or similar programs

USE_BZIP2=	YES
USE_GMAKE=	YES

LIB_DEPENDS=	confuse.0:${PORTSDIR}/devel/libconfuse

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
