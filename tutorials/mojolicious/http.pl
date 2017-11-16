#!/usr/bin/env perl

use Mojolicious::Lite;

# To test, use: ./myapp.pl get -v -M POST -c 'test' /echo
my $start_as_daemon = 0;

# Access request information
get '/agent' => sub {
    my $c       = shift;
    my $host    = $c -> req -> url -> to_abs -> host;
    my $ua      = $c -> req -> headers -> user_agent;

    $c -> render(text => "Request by $ua reached $host.");
};

# Echo the request body and send custom header with response
post '/echo' => sub {
    my $c = shift;
    $c -> res -> headers -> header('X-Bender' => 'Bite my shiny metal ass!');
    $c -> render(data => $c -> req -> body);
};

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:8080');
} else {
    app -> start;
}
