#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 0;

# /detection
# /detection.html
# /detection.txt
get '/detection' => sub {
    my $c = shift;
    $c -> render(template => 'detected');
};

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}

__DATA__

@@ detected.html.ep
<!DOCTYPE html>
<html>
    <head><title>Detected</title></head>
    <body>HTML was detected.</body>
</html>

@@ detected.txt.ep
TXT was detected
