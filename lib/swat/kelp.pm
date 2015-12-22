package swat::kelp;
1;

package main;

sub start_kelp_app {

    my $project_root_dir = project_root_dir();

    system("cd $project_root_dir && nohup carton exec nohup plackup -I $project_root_dir/lib ".
    "--host 0.0.0.0 --port 5000 ".
    "--access-log ".test_root_dir()."/access.log ".
    "--error-log ".test_root_dir()."/error.log ".
    'app.psgi 1>/dev/null 2>&1  & echo $! > /tmp/app.pid');

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

