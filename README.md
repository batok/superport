superport
=====

An erlang port example

Build, run and test
-------------------
    make sure rebar3 is in you path and ...
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
    
    exit from rebar3 shell with ctrl-c
    
