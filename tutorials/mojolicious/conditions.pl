#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 0;

# Firefox
get '/foo' => (agent => qr/Firefox/) => sub {
    my $c = shift;
    $c -> render(text => 'This is ok browser.');
};

# Internet Explorer
get '/foo' => (agent => qr/Internet Explorer/) => sub {
    my $c = shift;
    $c -> render(text => 'I guess this works widely.');
};

# Elinks
get '/foo' => (agent => qr/Elinks/) => sub {
    my $c = shift;
    $c -> render(text => 'Good stuff.');
};

# http://mojolicious.org/bar
get '/bar' => (host => 'mojolicious.org') => sub {
    my $c = shift;
    $c -> render(text => 'Hello Mojolicious.');
};

if ($start_as_daemon) {
	app -> start('daemon', '-l', 'http://*:80');
} else {
	app -> start;
}
