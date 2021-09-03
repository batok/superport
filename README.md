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
    (you have to see 4)
    > superport:bar(3).
    (you have to see 6)
    > superport:baz(3).
    (you have to see 0)
    escape from erl shell with ctrl-c
    
