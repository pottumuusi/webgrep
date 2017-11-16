#!/usr/bin/env perl

use Mojolicious::Lite;

# CSS selectors can be used to extract wanted information
# ./exception_and_not_found.pl get /dies '#error'
my $start_as_daemon = 0;

# Not found (404)
get '/missing' => sub { shift -> render (template => 'does_not_exist') };

# Exception (500)
get '/dies' => sub { die 'Intentional error' };

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:8080');
} else {
    app -> start;
}
