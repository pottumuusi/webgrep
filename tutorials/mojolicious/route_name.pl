#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 1;

# Render the template "index.html.ep"
get '/' => sub {
	my $c = shift;
	$c -> render;
} => 'index';

# Render the template "hello.html.ep"
get  '/hello';

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}

__DATA__

@@ index.html.ep
<%= link_to Hello	=> 'hello' %>.
<%= link_to Reload	=> 'index' %>.

@@ hello.html.ep
Hello World!
