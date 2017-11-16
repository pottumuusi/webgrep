#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = "1";

# Route leading to an action that renders a template
get '/foo' => sub {
	my $c = shift;
	$c -> stash(one => 23);
	$c -> render(template => 'magic', two => 24);
};

if ($start_as_daemon) {
	app -> start('daemon', '-l', 'http://*:8080');
} else {
	app -> start;
}

__DATA__
@@ magic.html.ep
The magic numbers are <%= $one %> and <%= $two %>.
