#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = "1";

# /foo?user=sri
get '/foo' => sub {
	my $c = shift;
	my $user = $c -> param('user');
	$c -> render(text => "Hello $user.");
};

if ($start_as_daemon) {
	app -> start('daemon', '-l', 'http://*:8080');
} else {
	app -> start;
}
