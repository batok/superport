superport
=====

An erlang port example

Build, Run and Test
-------------------
    make sure rebar3 is in you path and ...
    $ cd c_src
    $ make
    $ cd ..
    $ rebar3 shell
    > superport:start("priv/superport").
    > superport:foo(3).
    (you should see 4)
    
    > superport:bar(3).
    (you should see 6)
    
    > superport:baz(3).
    (you should see 0)
    
    > superport:sum(3,2).
    (you should see 5)

    > superport:stop().
    
    escape from erl shell with ctrl-c
    
