use Mojolicious::Lite;

get '/' => { text => 'Hello Mojolicious!' };

app -> start;
