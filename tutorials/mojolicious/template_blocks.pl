#!/usr/bin/env perl

# ./template_blocks.pl get /with_block

use Mojolicious::Lite;

my $start_as_daemon = 0;

get '/with_block' => 'block';

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}

__DATA__

@@ block.html.ep
% my $link = begin
    % my ($url, $name) = @_;
    Try <%= link_to $url => begin %><%= $name %><% end %>.
% end
<!DOCTYPE html>
<html>
    <head><title>This is a title</title></head>
    <body>
        %= $link->('http://mojolicious.org', 'Mojolicious')
        %= $link->('http://catalystframework.org', 'Catalyst')
    </body>
</html>
