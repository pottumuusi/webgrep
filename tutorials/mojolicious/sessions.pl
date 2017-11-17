#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 1;

# Custom "secrets" should be used to make signed cookies really tamper
# resistant.
# app -> secrets(['My secret passphrase here']);

##### This not working yet #####

# Access session data in action and template
get '/counter' => sub {
	my $c = shift;
	$c -> session -> counter = $c -> session -> (counter) + 1;
};

if ($start_as_daemon) {
	app -> start('daemon', '-l', 'http://*:80');
} else {
	app -> start;
}

__DATA__

@@ counte.html.ep
Counter: <%= session 'counter' %>
