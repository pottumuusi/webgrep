#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 0;

# GET /hello
get '/hello' => sub {
    my $c = shift;
    $c -> render(text => 'Hello World!');
};

# get -M PUT -c '<your message>' /hello
# PUT /hello
put '/hello' => sub {
    my $c       = shift;
    my $size    = length $c -> req -> body;
    $c -> render(text => "You uploaded $size bytes to /hello.");
};

# GET|POST|PATCH /bye
any ['GET', 'POST', 'PATCH'] => '/bye' => sub {
    my $c = shift;
    $c -> render(text => 'Bye World!');
};

# * /whatever
any '/whatever' => sub {
    my $c       = shift;
    my $method  = $c -> req -> method;
    $c -> render(text => "You called /whatever with $method.");
};

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}

__DATA__

@@ groovy.html.ep
Your name is <%= $you %>.
