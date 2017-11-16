#!/usr/bin/env perl

use Mojolicious::Lite;

# $ ./myapp.pl get -M PUT -c '{"message":"Hello Mojo!"}' /reverse
my $start_as_daemon = 0;

# Modify the received JSON document and return it
put '/reverse' => sub {
    my $c       = shift;
    my $hash    = $c -> req -> json;
    $hash -> { message } = reverse $hash -> { message };
    $c -> render(json => $hash);
};

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:8080');
} else {
    app -> start;
}
