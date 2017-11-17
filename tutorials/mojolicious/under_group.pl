#!/usr/bin/env perl

use Mojolicious::Lite;

my $start_as_daemon = 1;

# curl -H "X-Bender: empty" http://127.0.0.1/welcome
# curl -H "X-Bender: empty" -H "X-Awesome: empty" http://127.0.0.1/admin/dashboard

# Global logic shared by all routes
under sub {
    my $c = shift;
    return 1 if $c -> req -> headers -> header('X-Bender');
    $c -> render(text => "You're not Bender.");
};

# Admin section
group {

    # Local logic shared only by routes in this group
    under '/admin' => sub {
        my $c = shift;
        return 1 if $c -> req -> headers -> header('X-Awesome');
        $c -> render(text => "You're not awesome enough.");
        return undef;
    };

    # GET /Admin/dashboard
    get '/dashboard' => { text => 'Nothing to see here yet.' };
};

# GET /welcome
get '/welcome' => { text => 'Hi Bender.' };

if ($start_as_daemon) {
    app -> start('daemon', '-l', 'http://*:80');
} else {
    app -> start;
}
