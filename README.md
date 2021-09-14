superport
=====

An erlang port example

Build and run 
-------------
    This project contains an erlang port developed with zig language, that does the same as the C version.

    If you have zig installed ( I recommend using asdf ), then ...
    <BEGINNING OF ZIG setup>
    $ cd z_src
    (run the tests of zig code [optional])
    $ zig src/main.zig
    (build the executable)
    $ zig build
    $ cd ..
    $ cd priv
    $ cp ../z_src/zig-out/bin/eport .
    $ cd ..
    <END OF ZIG setup>

    make sure rebar3 is in you path and ...
    $ rebar3 shell
    (Let's try first the C version)
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
    (Let's try the zig version)

    8> Path2 = filename:join([code:priv_dir(superport), "eport"]),
    9> superport:start(Path2).
    (you should see the port displayed)
    10> superport:foo(3).
    (you should see 4)
    
    11> superport:bar(3).
    (you should see 6)
    
    12> superport:baz(3).
    (you should see 0)
    
    13> superport:sum(3,2).
    (you should see 5)

    14> superport:stop().
    
    exit from rebar3 shell with ctrl-c
    
    or run test ( which uses the erlang port C version only).
    $ rebar3 ct
