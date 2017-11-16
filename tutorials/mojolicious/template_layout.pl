#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 1;

get '/with_layout';

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}

__DATA__

@@ with_layout.html.ep
% title 'Green';
% layout 'green';
Hello World!

@@ layouts/green.html.ep
<!DOCTYPE html>
<html>
	<head><title> <%= title %> </title></head>
	<head> <%= content %> </head>
</html>
