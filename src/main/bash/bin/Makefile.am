SUBDIRS = . 

perlrun = @PERL@
bashrun = @BASHRUN@

servicesdir = $(sysconfdir)/rc.d/init.d

SERVICES = \
    inotifyd.in

GSERVICES = $(SERVICES:.in=)

GBASHSCRIPTS = $(BASHSCRIPTS:.in=)

libexec_SCRIPTS = $(GBASHSCRIPTS)
dist_noinst_DATA = $(BASHSCRIPTS) $(SERVICES)

services_DATA = $(GSERVICES)

@do_subst_command@

$(GBASHSCRIPTS): % : %.in
	$(do_subst) $< > $@

$(GSERVICES): % : %.in
	$(do_subst) $< > $@

CLEANFILES = $(GBASHSCRIPTS) $(GSERVICES)

install-data-hook:
	for a in $(GSERVICES); do \
	  chmod +x $(DESTDIR)$(servicesdir)/$$a; \
	done
