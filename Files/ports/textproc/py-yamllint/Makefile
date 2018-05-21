# Created by: Andre Rikkert de Koe - ARK-ICT <andre@ark-ict.nl>
# $FreeBSD$

PORTNAME=	yamllint
PORTVERSION=	1.11.1
CATEGORIES=	textproc python
MASTER_SITES=	${MASTER_SITE_CHEESESHOP} \
		http://freebsd.ark-ict.nl/ports/
MASTER_SITE_SUBDIR=	70/24/c1db9026a3e4a5d6148344997e97000522833a2a9b9f4a5ba33fae55e45a
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	andre@ark-ict.nl
COMMENT=	Linter for YAML files

LICENSE=	GPLv3

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pathspec>=0.5.3:textproc/py-pathspec@${FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}yaml>0:devel/py-yaml@${FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
