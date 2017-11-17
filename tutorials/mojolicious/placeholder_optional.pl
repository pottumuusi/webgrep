#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 0;

# Placeholder capturing is made optional by assigning default values

# /hello
# /hello/Mojo
get '/hello/:name' => {name => 'Catalyst', day => 'Monday' } => sub {
    my $c = shift;
    $c -> render(template => 'groovy', format => 'txt');
};

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}

__DATA__

@@ groovy.txt.ep
My name is <%= $name %> and it is <%= $day %>.
