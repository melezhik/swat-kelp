use Kelp::Less;
 
get '/hello/?name' => sub {
    my ( $self, $name ) = @_;
    "Hello " . ( $name // 'world' );
};
 
run;

