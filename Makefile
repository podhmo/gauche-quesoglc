#
# $Id: template.Makefile.in,v 1.8 2008-04-18 12:36:26 shirok Exp $
#

# General info
SHELL       = /bin/bash
prefix      = /usr
exec_prefix = ${prefix}
bindir      = ${exec_prefix}/bin
libdir      = ${exec_prefix}/lib
datadir     = ${datarootdir}
datarootdir = ${prefix}/share
srcdir      = .


# These may be overridden by make invocators
DESTDIR        =
GOSH           = /usr/bin/gosh
GAUCHE_CONFIG  = /usr/bin/gauche-config
GAUCHE_PACKAGE = /usr/bin/gauche-package
INSTALL        = /usr/bin/gauche-install -C

# Other parameters
SOEXT  = so
OBJEXT = o
EXEEXT = 
LOCAL_PATHS = 

# Module-specific stuff
PACKAGE   = gauche-quesoglc

ARCHFILES = gauche_quesoglc.$(SOEXT)
SCMFILES  = $(srcdir)/gl/glc.scm
HEADERS   = 

TARGET    = $(ARCHFILES)
GENERATED = 
CONFIG_GENERATED = Makefile config.cache config.log config.status \
		   configure.lineno autom4te*.cache $(PACKAGE).gpd

GAUCHE_PKGINCDIR  = $(DESTDIR)${libdir}/gauche/site/include
GAUCHE_PKGLIBDIR  = $(DESTDIR)${datadir}/gauche/site/lib
GAUCHE_PKGARCHDIR = $(DESTDIR)${libdir}/gauche/site/0.9/x86_64-pc-linux-gnu

gauche_quesoglc_SRCS = $(srcdir)/gauche_quesoglc.c $(srcdir)/gauche_quesoglclib.stub

all : $(TARGET)

gauche_quesoglc.$(SOEXT): $(gauche_quesoglc_SRCS)
	$(GAUCHE_PACKAGE) compile \
      --libs="-lGL -lGLU -lGLC" \
	  --local=$(LOCAL_PATHS) --verbose gauche_quesoglc $(gauche_quesoglc_SRCS)

check : all
	@rm -f test.log
	$(GOSH) -I. -I$(srcdir) $(srcdir)/test.scm > test.log

install : all
	$(INSTALL) -m 444 -T $(GAUCHE_PKGINCDIR) $(HEADERS)
	$(INSTALL) -m 444 -T $(GAUCHE_PKGLIBDIR) $(SCMFILES) 
	$(INSTALL) -m 555 -T $(GAUCHE_PKGARCHDIR) $(ARCHFILES)
	$(INSTALL) -m 444 -T $(GAUCHE_PKGLIBDIR)/.packages $(PACKAGE).gpd

uninstall :
	$(INSTALL) -U $(GAUCHE_PKGINCDIR) $(HEADERS)
	$(INSTALL) -U $(GAUCHE_PKGLIBDIR) $(SCMFILES) 
	$(INSTALL) -U $(GAUCHE_PKGARCHDIR) $(ARCHFILES)
	$(INSTALL) -U $(GAUCHE_PKGLIBDIR)/.packages $(PACKAGE).gpd

clean :
	$(GAUCHE_PACKAGE) compile --clean gauche_quesoglc $(gauche_quesoglc_SRCS)
	rm -rf core $(TARGET) $(GENERATED) *~ test.log so_locations

distclean : clean
	rm -rf $(CONFIG_GENERATED)

maintainer-clean : clean
	rm -rf $(CONFIG_GENERATED) configure VERSION

