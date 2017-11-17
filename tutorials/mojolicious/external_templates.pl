#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 0;

# Render template "templates/foo/bar.html.ep"
any '/external' => sub {
    my $c = shift;
    $c -> render(template => 'foo/bar');
};

if ($start_as_daemon) {
	app -> start('daemon', '-l', 'http://*:80');
} else {
	app -> start;
}
