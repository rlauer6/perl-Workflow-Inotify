SUBDIRS = .

include $(top_srcdir)/directories.inc

perlrun = @PERL@

if RPM_BUILD_MODE
perlwc = \# 
else
perlwc = @PERL@
endif

# you should be using perl5libdir as the base target of your perl
# modules, not as simply part of your PERLINCLUDE
ax_perl5_extra_includes_opt = @ax_perl5_extra_includes_opt@
ax_perl5_extra_includes = @ax_perl5_extra_includes@

logdir = @localstatedir@/log

PERLMODULES = 

WORKFLOWMODULES = \
    Workflow/Inotify.pm.in

WORKFLOW_INOTIFYMODULES = \
    Workflow/Inotify/Handler.pm.in

GPERLMODULES             = $(PERLMODULES:.pm.in=.pm)
GWORKFLOWMODULES         = $(WORKFLOWMODULES:.pm.in=.pm)
GWORKFLOW_INOTIFYMODULES = $(WORKFLOW_INOTIFYMODULES:.pm.in=.pm)

G1MANPAGES = $(GPERLSCRIPTS:.pm=.1man)

workflowdir         = $(perl5libdir)/Workflow
workflow_inotifydir = $(perl5libdir)/Workflow/Inotify

workflow_DATA         = $(GWORKFLOWMODULES)
workflow_inotify_DATA = $(GWORKFLOW_INOTIFYMODULES)
perl5lib_DATA         = $(GPERLMODULES)

dist_noinst_DATA = \
    $(PERLMODULES) \
    $(WORKFLOWMODULES) \
    $(WORKFLOW_INOTIFYMODULES)

man1_MANS = $(G1MANPAGES)

@do_subst_command@

if USING_PERL5_EXTRA_INCLUDES
PERL5_EXTRA_INCLUDES = $(ax_perl5_extra_includes_opt)
else
endif

# Please see the notes concerning PERLINCLUDE in the ../bin/Makefile.am file
PERLINCLUDE = \
    -I $(builddir) \
    -I $(builddir)/../lib \
    $(PERL5_EXTRA_INCLUDES) \
    -I $(perl5libdir)

%.pm:  %.pm.in
	test -d "$$(dirname "$@")" || $(INSTALL) -d "$$(dirname "$@")"
	$(do_subst) $< > $@
	$(perlwc) $(PERLINCLUDE) -wc $@ || { rm $@ && exit 1; }

all: README.md

CLEANFILES = \
    $(GPERLMODULES) \
    $(GWORKFLOWMODULES) \
    $(GWORKFLOW_INOTIFYMODULES) \
    README.md

README.md: $(GWORKFLOWMODULES)
	pod2markdown $< > $@
	cp $@ $(abs_top_builddir)/$$(basename $@)

$(G1MANPAGES): %.1man : %.pm
	target_name="$@";\
	tname=$$(echo "$${target_name}" | sed -e 's/\.1man$$//') ;\
	"$(POD2MAN)"  $< \
	--center="$(PACKAGE)" \
	--name="$${tname}" \
	--release=$(PACKAGE)-$(VERSION) \
	--section=1man > "$${target_name}" || true

.PHONY: clean-local
clean-local:
	$(MAKE) clean-generated-man-pages

.PHONY: clean-generated-man-pages
clean-generated-man-pages:
	for mpath in $(G1MANPAGES); do \
	rm -f "$${mpath}" ;\
	test $$? -eq 0 || exit 1 ;\
	done

if DISTCHECK_HACK
else
endif

if RPM_BUILD_MODE
else
install-data-hook:
endif



