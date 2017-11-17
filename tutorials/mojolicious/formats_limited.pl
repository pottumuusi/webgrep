#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 0;

# Default format is html. Restrictive placeholders can be used to limit
# possible values.

# /hello.json
# /hello.txt
get '/hello' => [ format => [ 'json', 'txt' ] ] => sub {
    my $c = shift;
    return $c -> render(json => { hello => 'world'})
        if $c -> stash('format') eq 'json';
    $c -> render(text => 'hello world');
};

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}
