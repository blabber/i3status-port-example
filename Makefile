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

PLIST_FILES=	bin/${PORTNAME}
PORTEXAMPLES=	i3status.conf
MAN1=		i3status.1

post-patch:
	@${REINPLACE_CMD} -e "s,%%PREFIX%%,${PREFIX}," ${WRKSRC}/man/i3status.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/i3status ${PREFIX}/bin/i3status
	${INSTALL_MAN} ${WRKSRC}/man/i3status.1 ${MANPREFIX}/man/man1/i3status.1
.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/i3status.conf ${EXAMPLESDIR}/i3status.conf
.endif

.include <bsd.port.mk>
