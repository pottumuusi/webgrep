#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 0;

# /hello
get '/hello' => [ format => 0 ] => { text => 'No format detection.' };

# Disable detection and allow the following routes to re-enable it on demand
under [ format => 0 ];

# /foo
get '/foo' => { text => 'No format detection again.' };

# /bar.txt
get '/bar' => [ format => 'txt' ] => { text => ' Just one format.' };

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}
