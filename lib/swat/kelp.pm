package swat::kelp;
1;

package main;

sub start_kelp_app {

    my $project_root_dir = project_root_dir();

    system("cd $project_root_dir && carton exec plackup -I $project_root_dir/lib -s Starman  -D 'app.psgi' --pid /tmp/app.pid");

    my $pid = get_app_pid();
    ok($pid,"kelp is running . pid: $pid");

}

sub stop_kelp_app {

    my $pid = get_app_pid();
    `kill $pid` if $pid;

}

sub get_app_pid {
    my $pid;
    if (open F, "/tmp/app.pid"){
        $pid = <F>;
        close F;
    }
    return $pid;
}

1;

