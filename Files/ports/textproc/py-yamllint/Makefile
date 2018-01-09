# Created by: Andre Rikkert de Koe - ARK-ICT <andre@ark-ict.nl>
# $FreeBSD$

PORTNAME=	yamllint
PORTVERSION=	1.10.0
CATEGORIES=	textproc python
MASTER_SITES=	${MASTER_SITE_CHEESESHOP} \
		http://freebsd.ark-ict.nl/ports/
MASTER_SITE_SUBDIR=47/b9/512bbd1b8ee92196548d56eba7ca1242f5eb14255fa44f772399abdb9bde
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	andre@ark-ict.nl
COMMENT=	Linter for YAML files

LICENSE=	GPLv3RLE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pathspec>=0.5.3:textproc/py-pathspec \
		${PYTHON_PKGNAMEPREFIX}yaml>0:devel/py-yaml

USES=		python
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
