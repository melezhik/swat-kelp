# SYNOPSIS

Runs regression [swat](https://github.com/melezhik/swat) checks against a sample kelp application.

# Check List

* Kelp footprint get sent via http headers
* Placeholders for parameters

# INSTALL

    sparrow plg install swat-kelp

# USAGE

    sparrow project create kelp
    sparrow project check_add kelp regress-check
    sparrow project check_set kelp regress-check -p swat-kelp -u 127.0.0.1:5000
    sparrow project check_run kelp regress-check

# Kelp application

    #!/usr/bin/perl
    use Kelp::Less;
    
    get '/hello/?name' => sub {
        my ( $self, $name ) = @_;
        "Hello " . $name // 'world';
    };
    
    run;


# Sample Output

    /home/vagrant/.swat/.cache/13404/prove/virtual/placeholders/00.GET.t .........
    ok 1 - kelp is running . pid: 13433
    #
    ok 2 - GET 127.0.0.1:5000/hello/Kelp! succeeded
    # response saved to /home/vagrant/.swat/.cache/13404/prove/FxwqZvTzeP
    ok 3 - output match 'X-Framework: Perl Kelp'
    ok 4 - output match 'Kelp!'
    ok 5 - response is already set
    # response saved to /home/vagrant/.swat/.cache/13404/prove/VjlKq96rDY
    ok 6 - output match 'ok'
    1..6
    ok
    /home/vagrant/.swat/.cache/13404/prove/virtual/placeholder-default/00.GET.t ..
    ok 1 - kelp is running . pid: 13442
    #
    ok 2 - GET 127.0.0.1:5000/hello/ succeeded
    # response saved to /home/vagrant/.swat/.cache/13404/prove/lAXmQw874J
    ok 3 - output match 'X-Framework: Perl Kelp'
    ok 4 - output match 'world'
    ok 5 - response is already set
    # response saved to /home/vagrant/.swat/.cache/13404/prove/WPSVq1vZQ0
    ok 6 - output match 'ok'
    1..6
    ok
    /home/vagrant/.swat/.cache/13404/prove/hello-world/00.GET.t ..................
    ok 1 - kelp is running . pid: 13450
    #
    ok 2 - GET 127.0.0.1:5000/hello-world succeeded
    # response saved to /home/vagrant/.swat/.cache/13404/prove/TA22TxOIui
    ok 3 - output match '200 OK'
    ok 4 - output match 'Hello, world!'
    1..4
    ok
    All tests successful.
    Files=3, Tests=16,  4 wallclock secs ( 0.03 usr  0.01 sys +  0.24 cusr  0.02 csys =  0.30 CPU)
    Result: PASS
            
# AUTHOR

Alexey Melezhik

