# NEWS

This is the 'NEWS' file for the 'perl-Workflow-Inotify' project. This file contains
information on changes since the last release of the package, as well as a
running list of changes from previous versions.  If critical bugs are found in
any of the software, notice of such bugs and the versions in which they were
fixed will be noted here, as well.

---

# perl-Workflow-Inotify 1.0.5 (2023-04-08)

> This version fixes a bug that prevented `boolean()` from being
> exported

## Enhancements

* None

## Fixes

* there were two `use parent` declarations that prevented `boolean()`
  from being exported

# perl-Workflow-Inotify 1.0.4 (2023-03-31)

> This version checks to make sure you do not overwrite accessors and
> adds a new method for returning boolean values from the config object.

## Enhancements

* check for redefinition of accessors

## Fixes

* `new()` method was not loading config if scalar passed


# perl-Workflow-Inotify 1.0.3 (2023-02-10)

> This version adds a feature that will create setters/getters if the
> configuration file contains a section using the a canonical version
> of the handler name (lower and snaked case).

## Enhancements

* create accessors if a section exists in the configuration file named
  after the handler class (example: `[workflow_inotify_handler]`)

## Fixes

_None_

# perl-Workflow-Inotify 1.0.2 (2023-02-09)

> This version moves the documentation from `inotify.pl` to
> `Workflow::Inotify` in anticipation releasing to CPAN

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

# perl-Workflow-Inotify 1.0.0 (2016-05-13)

> Initial release

## Enhancements

_None_

## Fixes

_None_

