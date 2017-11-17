#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 0;

# Example which does not seem to produce wanted result
# curl -H "Content-Type: application/json" -X POST -d '{"username":"xyz","password":"xyz"}' http://localhost:3000/api/login

# /hello (Accept: application/json)
# /hello (Accept: application/xml)
# /hello.json
# /hello.xml
# /hello?format=json
# /hello?format=xml
get '/hello' => sub {
    my $c = shift;
    $c -> respond_to (
        json    => { json => { hello => 'world'} },
        xml     => { text => '<hello>world</hello>' },
        any     => { data => '', status => 204 }
    );
};

if ($start_as_daemon) {
	app -> start('daemon', '-l', 'http://*:80');
} else {
	app -> start;
}

# MIME type mappings can be extended or changed easily with "types"
# in Mojolicious.
# app -> types -> type(rdf => 'application/rdf+xml');
