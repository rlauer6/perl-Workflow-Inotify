# NAME

inotify.pl - script to daemonize a `Linux::Inotify2` handler

# SYNOPSIS

    inotify.pl --config=inotify.cfg

# DESCRIPTION

Script harness for `Workflow::Inotify::Handler` classes.  This is
typically launched as a daemon by the `inotifyd` script or using a
`systemctl` service description.

See [Workflow::Inotify::Handler](https://metacpan.org/pod/Workflow%3A%3AInotify%3A%3AHandler)

# HOW IT WORKS

The `inotify.pl` script reads a `.ini` style configuration file and
installs handlers implemented by Perl classes to process kernel events
generated from file or directory changes. Using [Linux::Inotify2](https://metacpan.org/pod/Linux%3A%3AInotify2),
the script instantiates one or more handlers which process
directory events and then daemonizes this script.

## The Configuration File

The configuration file is a `.ini` style configuration file
consisting of a `[global]` section and one or more sections named
using the convention: `[watch_{name}]` where `{name}` is the snake
case representation of the directory to watch.

Boolean values in the configuration file can be set as '0', '1',
'true', 'false', 'on', 'off', 'yes', or 'no'. Take your pick.

Example:

    [global]
    daemonize = yes
    logfile = /var/log/inotify.log
    block = yes
    perl5lib = $HOME/lib/perl5
    
    [watch_tmp]
    dir = /tmp
    mask = IN_MOVED_TO | IN_CLOSE_WRITE
    handler = Workflow::Inotify::Handler

Sections are described below.

- `[global]`

    The `global` section contains configuration values used throughout
    the script. All of the values in the `global` section are optional.

    - sleep

        Amount of time in seconds to sleep after polling for a watch event.

    - block

        Boolean that indicates if the watcher should block waiting for an
        event. If you set `block` to a false value, you should also consider
        a sleep value.

        default: true

    - logfile

        Name of a file that will receive all STDERR and STDOUT messages.

    - perl5lib

        One or more paths to add to `@INC`. Paths should be ':' separated.

        Example:

            perl5lib = $HOME/lib/perl5:/usr/local/lib/perl5

        Words that begin with '$' are interpretted to be environment variables
        (for this variable only). You can also use '~' to denote your home
        directory ($HOME) if it is defined.

    - verbose

        Output messages at beginning of script.

        default: true

    - daemonize

        Boolean that indicates whether the script should be daemonize using [Proc::Daemon](https://metacpan.org/pod/Proc%3A%3ADaemon).

        default: false

- `[watch_{name}]`

    The `watch` section contains settings for the directories to watch.

    - dir

        Directory to watch.

        Example:

            [watch_example]

            dir =  I</var/spool/junk>.

    - mask

        One or more `inotify` event names as described in _man 7
        inotify_. These events should be pipe delimited (as in "oring" them
        together).

        Example:

            mask = IN_MOVED_FROM | IN_MOVED_TO

        These are also described in [Workflow::Inotify::Handler](https://metacpan.org/pod/Workflow%3A%3AInotify%3A%3AHandler).

    - handler

        The name of a Perl class that has at least a `handler()` method. This
        handler will be called with a [Linux::Inotify::Event](https://metacpan.org/pod/Linux%3A%3AInotify%3A%3AEvent) object.

        Example:

            handler = Workflow::Inotify::Handler

        A typical handler might look something like this:

            package MyHandler;
            
            use strict;
            use warnings;
            
            use Data::Dumper;

            use parent qw(Workflow::Inotify::Handler);
            
            sub new {
              my ( $class, @args ) = @_;
            
              return $class->SUPER::new(@args);
            }
            
            sub handler {
              my ( $self, $event ) = @_;
            
              return print {*STDERR} Dumper( [ event => $event ] );
            }

        1;

## Application Configuration

You can create a section in the configuration file that is named for
the handler class. For example, if your handler class is
`Workflow::S3::Uploader`, then create a section in the configuration
file named `workflow_s3_uploader`. Place any values you wish in that
section. The configuration object is passed to your handler's `new()`
method so you can access the values as needed. The configuration
object is an instance of [Config::IniFiles](https://metacpan.org/pod/Config%3A%3AIniFiles).

If you use the parent class [Workflow::Inotify::Handler](https://metacpan.org/pod/Workflow%3A%3AInotify%3A%3AHandler), its
`new()` method will automatically create setters and getters for these
values.

See [Workflow::Inotify::Handler](https://metacpan.org/pod/Workflow%3A%3AInotify%3A%3AHandler) for more details.

# VERSION

This documentation refers to version 1.0.6

# REPOSITORY

[https://github.com/rlauer6/perl-Workflow-Inotify.git](https://github.com/rlauer6/perl-Workflow-Inotify.git)

# AUTHOR

Rob Lauer - <rlauer6@comcast.net>

# SEE ALSO 

[Linux::Inotify2](https://metacpan.org/pod/Linux%3A%3AInotify2), [Config::IniFiles](https://metacpan.org/pod/Config%3A%3AIniFiles), [Workflow::Inotify::Handler](https://metacpan.org/pod/Workflow%3A%3AInotify%3A%3AHandler)
