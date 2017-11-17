#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 0;

# Take a closer look at all generated regular expressions with command
# Mojolicious::Command::routes
# http://mojolicious.org/perldoc/Mojolicious/Command/routes
#
# ./placeholder_restrictive.pl routes -v

# /test
# /123
any '/:foo' => [ foo => [ 'test', '123' ] ] => sub {
    my $c       = shift;
    my $foo     = $c -> param('foo');
    $c -> render(text => "Our :foo placeholder matched $foo");
};

# Placeholders get compiled to regular expressions internally. This can be
# customized. Do not use ^ and $, or capturing groups (...). Non-capturing
# groups (?:...) are ok.

# /1
# /123
any '/:bar' => [ bar => qr/\d+/ ] => sub {
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

@@ groovy.txt.ep
My name is <%= $name %> and it is <%= $day %>.
