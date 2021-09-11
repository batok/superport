superport
=====

An erlang port example

Build and run 
-------------
    make sure rebar3 is in you path and ...
    $ rebar3 shell
    1> Path = filename:join([code:priv_dir(superport), "superport"]),
    2> superport:start(Path).
    (you should see the port displayed)
    3> superport:foo(3).
    (you should see 4)
    
    4> superport:bar(3).
    (you should see 6)
    
    5> superport:baz(3).
    (you should see 0)
    
    6> superport:sum(3,2).
    (you should see 5)

    7> superport:stop().
    
    exit from rebar3 shell with ctrl-c
    
    or run test.
    $ rebar3 ct
