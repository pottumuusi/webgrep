#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 1;

# Can get stuff under public/ also
# Test content negotiation with Range, If-None_match and If-Modified-Since
# $ ./myapp.pl get /something.js -v -H 'Range: bytes=2-4'

if ($start_as_daemon) {
	app -> start('daemon', '-l', 'http://*:80');
} else {
	app -> start;
}

__DATA__

@@ something.js
alert('hello!');

@@ test.txt (base64)
dGVzdCAxMjMKbGFsYWxh
