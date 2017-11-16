#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = "1";

get '/' => sub {
	my $c = shift;
	$c -> render(text => 'Hello World!');
};

if ($start_as_daemon) {
	app -> start('daemon', '-l', 'http://*:8080');
} else {
	app -> start;
}
