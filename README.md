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

    /home/vagrant/.swat/.cache/8817/prove/virtual/placeholders/00.GET.t ..
    ok 1 - kelp is running . pid: 8839
    #
    ok 2 - GET 127.0.0.1:5000/hello/Kelp! succeeded
    # response saved to /home/vagrant/.swat/.cache/8817/prove/Q17GqJaGzc
    ok 3 - output match 'X-Framework: Perl Kelp'
    ok 4 - output match 'Kelp!'
    ok 5 - response is already set
    # response saved to /home/vagrant/.swat/.cache/8817/prove/gdcT2vbM13
    ok 6 - output match 'ok'
    1..6
    ok
    All tests successful.
    Files=1, Tests=6,  1 wallclock secs ( 0.03 usr  0.00 sys +  0.32 cusr  0.00 csys =  0.35 CPU)
    Result: PASS
        
# AUTHOR

Alexey Melezhik

