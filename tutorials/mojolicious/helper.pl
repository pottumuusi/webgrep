#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 1;

# "helper" is a keyword
# A helper to identify visitors
helper whois => sub {
	my $c		= shift;
	my $agent	= $c -> req -> headers -> user_agent || 'Anonymous';
	my $ip		= $c -> tx -> remote_address;
	return "$agent ($ip)";
};

# Use helper in action and template
get '/secret' => sub {
	my $c		= shift;
	my $user	= $c -> whois;
	$c -> app -> log -> debug("Request from $user");
};

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}

__DATA__

@@ secret.html.ep
We know who you are <%= whois %>
