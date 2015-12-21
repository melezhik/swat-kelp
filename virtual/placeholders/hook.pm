use swat::kelp;

stop_kelp_app();

start_kelp_app();

run_swat_module( GET => '/hello/name', { name => 'Kelp!' } );

stop_kelp_app();

set_response('ok');
