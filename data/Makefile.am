MAINTAINERCLEANFILES = Makefile.in

SUBDIRS= languages . scripts

DATATOPDIR = $(datadir)/$(PACKAGE_NAME)

FLISTS = transparent1x1.gif dansguardian.pl

EXTRA_DIST = $(FLISTS)

install-data-local: 
	$(mkinstalldirs) $(DESTDIR)$(DATATOPDIR) && \
	$(mkinstalldirs) $(DESTDIR)$(DGLOGLOCATION) && \
	$(mkinstalldirs) $(DESTDIR)$(DGPIDDIR) && \
	for l in $(FLISTS) ; do \
		echo "$(INSTALL_DATA) $$l $(DESTDIR)$(DATATOPDIR)/$$l"; \
		$(INSTALL_DATA) $$l $(DESTDIR)$(DATATOPDIR)/$$l; \
	done

uninstall-local:
	for l in $(FLISTS) ; do \
		rm -f $(DESTDIR)$(DATATOPDIR)/$$l ; \
	done
