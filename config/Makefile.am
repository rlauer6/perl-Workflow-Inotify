SUBDIRS = .

CONFIG = \
    inotify.cfg.in

GCONFIG = $(CONFIG:.cfg.in=.cfg)
notifyconfdir = $(sysconfdir)/workflow

notifyconf_DATA = $(GCONFIG)
dist_noinst_DATA = $(CONFIG)

@do_subst_command@

$(GCONFIG): % : %.in
	$(do_subst) $< > $@

all:

CLEANFILES = $(GCONFIG)

