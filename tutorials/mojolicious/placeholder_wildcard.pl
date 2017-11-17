#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 0;

# /hello/test
# /hello/test123
# /hello/test.123/test/123

get '/hello/*you' => 'groovy';

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}

__DATA__

@@ groovy.html.ep
Your name is <%= $you %>.
