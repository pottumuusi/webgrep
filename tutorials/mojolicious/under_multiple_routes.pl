#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 0;

# /foo
under '/foo';

# /foo/bar
get '/bar' => { text => 'foo bar' };

# /foo/baz
get '/baz' => { text => 'foo baz' };

# / (reset)
under '/' => { msg => 'whatever' };

# /bar
get '/bar' => { inline => '<%= $msg %> works' };

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}
