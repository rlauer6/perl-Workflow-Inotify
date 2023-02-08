# NEWS

This is the 'NEWS' file for the 'perl-Workflow-Inotify' project. This file contains
information on changes since the last release of the package, as well as a
running list of changes from previous versions.  If critical bugs are found in
any of the software, notice of such bugs and the versions in which they were
fixed will be noted here, as well.

---

# perl-Workflow-Inotify 1.0.0 (2016-05-13)

> Initial release

## Enhancements

_None_

## Fixes

_None_

# perl-Workflow-Inotify 1.0.1 (2023-02-08)

> This version provides a re-factored `inotify.pl` script with better documentation.

## Enhancements

`inotify.pl`

* better documentation in the form of the [`README.md`](README.md)
* boolean `verbose` to control startup verbosity
* `perl5lib` option can now be `:` delimited list of paths
* messages on startup that show configuration
* boolean values in config can now be `0`, `1`, `true`, `false`, `on`,
  `off`, `yes`, `no`
* `logfile` is now optional, `STDOUT`, `STDERR` redirected to logfile _only if logfile is configured_
* SIGHUP will reread configuration and restart handlers
* `daemonize` option to enable, disable daemoization via
  `Proc::Daemon`
  
## Fixes

_None_
