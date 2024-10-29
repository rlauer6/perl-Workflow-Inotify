#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;
use English qw(-no_match_vars);

use Test::More;

use_ok('Workflow::Inotify::Handler');

done_testing;

1;

__DATA__
[global]
daemonize = yes
logfile = inotify.log
block = yes
perl5lib = /home/rclauer/lib/perl5

[watch_tmp]
dir = /tmp/foo
mask = IN_MOVED_TO | IN_CLOSE_WRITE
handler = Workflow::Inotify::Handler


