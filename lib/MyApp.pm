package MyApp;
use parent 'Kelp';
 
sub build {
    my $self = shift;
    my $r = $self->routes;
    $r->add( "/hello-world", sub { "Hello, world!" } );
    $r->add( '/hello/?name', 'greet' );
}
 
 
sub greet {

    my ( $self, $name ) = @_; 
    "Hello " . ($name || 'world')

}

1;

