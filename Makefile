#
# "Software pw3270, desenvolvido com base nos códigos fontes do WC3270  e X3270
# (Paul Mattes Paul.Mattes@usa.net), de emulação de terminal 3270 para acesso a
# aplicativos mainframe. Registro no INPI sob o nome G3270.
#
# Copyright (C) <2008> <Banco do Brasil S.A.>
#
# Este programa é software livre. Você pode redistribuí-lo e/ou modificá-lo sob
# os termos da GPL v.2 - Licença Pública Geral  GNU,  conforme  publicado  pela
# Free Software Foundation.
#
# Este programa é distribuído na expectativa de  ser  útil,  mas  SEM  QUALQUER
# GARANTIA; sem mesmo a garantia implícita de COMERCIALIZAÇÃO ou  de  ADEQUAÇÃO
# A QUALQUER PROPÓSITO EM PARTICULAR. Consulte a Licença Pública Geral GNU para
# obter mais detalhes.
#
# Você deve ter recebido uma cópia da Licença Pública Geral GNU junto com este
# programa;  se  não, escreva para a Free Software Foundation, Inc., 59 Temple
# Place, Suite 330, Boston, MA, 02111-1307, USA
#
# Contatos:
#
# perry.werneck@gmail.com	(Alexandre Perry de Souza Werneck)
# erico.mendonca@gmail.com	(Erico Mascarenhas de Mendonça)
#

#---[ Library configuration ]------------------------------------------------------------

MODULE_NAME=smartcardautentication
SERVICE_NAME=ipc3270d
PACKAGE_NAME=smartcardautentication
PRODUCT_NAME=@PRODUCT_NAME@

SOURCES= \
	$(wildcard src/plugin/*.c) \
	$(wildcard src/plugin/windows/*.rc)

#---[ Tools ]----------------------------------------------------------------------------

CC=gcc
LD=gcc
LN_S=cp -pR
MKDIR=/usr/bin/mkdir -p
INSTALL=/usr/bin/install -c
INSTALL_DATA=${INSTALL} -m 644
INSTALL_PROGRAM=${INSTALL}
XGETTEXT=/mingw64/bin/xgettext
MSGCAT=/mingw64/bin/msgcat
WINDRES=/mingw64/bin/windres
AR=/mingw64/bin/ar
VALGRIND=@VALGRIND@
STRIP=

#---[ Paths ]----------------------------------------------------------------------------

prefix=/mingw64
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
sbindir=${exec_prefix}/sbin
libdir=${exec_prefix}/lib
includedir=${prefix}/include
datarootdir=${prefix}/share
localedir=${datarootdir}/locale
docdir=${datarootdir}/doc/${PACKAGE_TARNAME}
sysconfdir=${prefix}/etc

BASEDIR=/home/Gustavo/plugins_pw3270/smartcardautentication

OBJDIR=$(BASEDIR)/.obj
OBJDBG=$(OBJDIR)/Debug
OBJRLS=$(OBJDIR)/Release

BINDIR=$(BASEDIR)/.bin
BINDBG=$(BINDIR)/Debug
BINRLS=$(BINDIR)/Release

#---[ Rules ]----------------------------------------------------------------------------

LDFLAGS= \
	 -pthread

CFLAGS= \
	-g -O2 -pthread -D_WIN32_WINNT=0x0600 -fPIC \
	-DBUILD_DATE=`date +%Y%m%d` \
	-DLOCALEDIR=$(localedir) \
	-DLIB3270_NAME=3270 -DLIB3270_REVISION=20211108 -IC:/msys64/mingw64/include/gtk-3.0 -IC:/msys64/mingw64/include/pango-1.0 -IC:/msys64/mingw64/include -IC:/msys64/mingw64/include/glib-2.0 -IC:/msys64/mingw64/lib/glib-2.0/include -IC:/msys64/mingw64/include/harfbuzz -IC:/msys64/mingw64/include/freetype2 -IC:/msys64/mingw64/include/libpng16 -mms-bitfields -IC:/msys64/mingw64/include/fribidi -IC:/msys64/mingw64/include/cairo -IC:/msys64/mingw64/include/lzo -IC:/msys64/mingw64/include/pixman-1 -mms-bitfields -mms-bitfields -mms-bitfields -mms-bitfields -mms-bitfields -mms-bitfields -mms-bitfields -IC:/msys64/mingw64/include/gdk-pixbuf-2.0 -mms-bitfields -mms-bitfields -mms-bitfields -IC:/msys64/mingw64/include/atk-1.0 -mms-bitfields -mms-bitfields -mms-bitfields -pthread -mms-bitfields  \
	-IC:/msys64/mingw64/include/gtk-3.0 -IC:/msys64/mingw64/include/pango-1.0 -IC:/msys64/mingw64/include -IC:/msys64/mingw64/include/glib-2.0 -IC:/msys64/mingw64/lib/glib-2.0/include -IC:/msys64/mingw64/include/harfbuzz -IC:/msys64/mingw64/include/freetype2 -IC:/msys64/mingw64/include/libpng16 -mms-bitfields -IC:/msys64/mingw64/include/fribidi -IC:/msys64/mingw64/include/cairo -IC:/msys64/mingw64/include/lzo -IC:/msys64/mingw64/include/pixman-1 -mms-bitfields -mms-bitfields -mms-bitfields -mms-bitfields -mms-bitfields -mms-bitfields -mms-bitfields -IC:/msys64/mingw64/include/gdk-pixbuf-2.0 -mms-bitfields -mms-bitfields -mms-bitfields -IC:/msys64/mingw64/include/atk-1.0 -mms-bitfields -mms-bitfields -mms-bitfields -pthread -mms-bitfields  \
	-IC:/msys64/mingw64/include/glib-2.0 -IC:/msys64/mingw64/lib/glib-2.0/include -IC:/msys64/mingw64/include -mms-bitfields -pthread -mms-bitfields 

LIBS= \
	 -lws2_32 -lwtsapi32 -lcomdlg32 \
	-lv3270 -l3270 -LC:/msys64/mingw64/lib -lgtk-3 -lgdk-3 -lz -lgdi32 -limm32 -lshell32 -lole32 -Wl,-luuid -lwinmm -ldwmapi -lsetupapi -lcfgmgr32 -lpangowin32-1.0 -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl  \
	-LC:/msys64/mingw64/lib -lgtk-3 -lgdk-3 -lz -lgdi32 -limm32 -lshell32 -lole32 -Wl,-luuid -lwinmm -ldwmapi -lsetupapi -lcfgmgr32 -lpangowin32-1.0 -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl  \
	-LC:/msys64/mingw64/lib -lgmodule-2.0 -pthread -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl 

#---[ Debug Rules ]----------------------------------------------------------------------

$(OBJDBG)/%.o: \
	%.c
	
	@echo $< ...
	@$(MKDIR) $(@D)

	@$(CC) \
		$(CFLAGS) \
		-DDEBUG=1 \
		-MM -MT $@ -MF $(patsubst %.o,%.d,$@) $<

	@$(CC) \
		$(CFLAGS) \
		-Wall -Wextra -fstack-check \
		-DDEBUG=1 \
		-DPLUGIN_PATH=$(BINDBG) \
		-o $@ -c $<

$(OBJDBG)/%.o: \
	%.rc

	@echo $< ...
	@$(MKDIR) $(@D)
	@$(WINDRES) $< -O coff -o $@

#---[ Release Rules ]--------------------------------------------------------------------

$(OBJRLS)/%.o: \
	%.c
	@echo $< ...
	@$(MKDIR) $(@D)

	@$(CC) \
		$(CFLAGS) \
		-DNDEBUG=1 \
		-MM -MT $@ -MF $(patsubst %.o,%.d,$@) $<

	@$(CC) \
		$(CFLAGS) \
		-DNDEBUG=1 \
		-o $@ -c $<

$(OBJRLS)/%.o: \
	%.rc

	@echo $< ...
	@$(MKDIR) $(@D)
	@$(WINDRES) $< -O coff -o $@

#---[ Release Targets ]------------------------------------------------------------------

all: \
	$(BINRLS)/$(MODULE_NAME).dll

Release: \
	$(BINRLS)/$(MODULE_NAME).dll

$(BINRLS)/$(MODULE_NAME).dll: \
	$(foreach SRC, $(basename $(PLUGIN_SOURCES)), $(OBJRLS)/$(SRC).o)

	@$(MKDIR) $(@D)
	@echo $< ...
	@$(LD) \
		-shared -Wl,-soname,$(@F) \
		-o $@ \
		$(LDFLAGS) \
		$(foreach SRC, $(basename $(PLUGIN_SOURCES)), $(OBJRLS)/$(SRC).o) \
		$(LIBS)

#---[ Install Targets ]------------------------------------------------------------------

install: \
	install-plugin-windows

install-plugin-linux: \
	$(BINRLS)/$(MODULE_NAME).dll

	@$(MKDIR) $(DESTDIR)$(libdir)/$(PRODUCT_NAME)-plugins

	@$(INSTALL_PROGRAM) \
		$(BINRLS)/$(MODULE_NAME).dll \
		$(DESTDIR)$(libdir)/$(PRODUCT_NAME)-plugins

install-plugin-windows: \
	$(BINRLS)/$(MODULE_NAME).dll

	@$(MKDIR) $(DESTDIR)$(libdir)/$(PRODUCT_NAME)-plugins

	@$(INSTALL_PROGRAM) \
		$(BINRLS)/$(MODULE_NAME).dll \
		$(DESTDIR)$(libdir)/$(PRODUCT_NAME)-plugins/$(MODULE_NAME).dll

	@$(STRIP) \
		--discard-all \
		$(DESTDIR)$(libdir)/$(PRODUCT_NAME)-plugins/$(MODULE_NAME).dll

#---[ Debug Targets ]--------------------------------------------------------------------

Debug: \
	$(BINDBG)/$(MODULE_NAME).dll

$(BINDBG)/$(MODULE_NAME).dll: \
	$(foreach SRC, $(basename $(SOURCES)), $(OBJDBG)/$(SRC).o)

	@$(MKDIR) $(@D)
	@echo $< ...
	@$(LD) \
		-shared -Wl,-soname,$(@F) \
		-o $@ \
		$(LDFLAGS) \
		$(foreach SRC, $(basename $(SOURCES)), $(OBJDBG)/$(SRC).o) \
		$(LIBS)


#---[ Clean Targets ]--------------------------------------------------------------------

clean: \
	cleanDebug \
	cleanRelease

cleanDebug:

	@rm -fr $(OBJDBG)
	@rm -fr $(BINDBG)

cleanRelease:

	@rm -fr $(OBJRLS)
	@rm -fr $(BINRLS)

clean: \
	cleanDebug \
	cleanRelease

-include $(foreach SRC, $(basename $(PLUGIN_SOURCES)), $(OBJDBG)/$(SRC).d)
-include $(foreach SRC, $(basename $(PLUGIN_SOURCES)), $(OBJRLS)/$(SRC).d)

-include $(foreach SRC, $(basename $(SERVICE_SOURCES)), $(OBJDBG)/$(SRC).d)
-include $(foreach SRC, $(basename $(SERVICE_SOURCES)), $(OBJRLS)/$(SRC).d)


