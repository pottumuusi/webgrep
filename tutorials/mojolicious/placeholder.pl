#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 0;

# /foo/test
# /foo/test123
get '/foo/:bar' => sub {
    my $c       = shift;
    my $bar     = $c -> stash('bar');
    $c -> render(text => "Our :bar placeholder matched $bar");
};

# /testsomething/foo
# /test123something/foo
get '/(:bar)something/foo' => sub {
    my $c       = shift;
    my $bar     = $c -> param('bar');
    $c -> render(text => "Our :bar placeholder matched $bar");
};

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}

__DATA__
