package swat::kelp;
1;

package main;

sub start_kelp_app {

    # this code make it sure
    # that app runs 
    # only once
    # at very begining
    # of tests run

    return if -f test_root_dir()."/run.ok";

    stop_kelp_app();

    my $project_root_dir = project_root_dir();
    my $port = $ENV{port};

    system(
        "cd $project_root_dir && nohup carton exec nohup plackup -I $project_root_dir/lib ".
        "--host 0.0.0.0 --port $port ".
        "--access-log ".test_root_dir()."/access.log ".
        "--error-log ".test_root_dir()."/error.log ".
        'app.psgi 1>/dev/null 2>&1  & echo $! > /tmp/app.pid '.
        "&& touch ".test_root_dir()."/run.ok"
    );

    my $pid = get_app_pid();
    ok($pid,"kelp app is running. pid: $pid");

}

sub stop_kelp_app {

    my $pid = get_app_pid();

    if ($pid){
        `kill $pid`;
        ok(1,"stop old kelp app at pid: $pid"); 
    }

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

