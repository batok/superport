superport
=====

An erlang port example

Build
-----

    $ rebar3 compile

Run and Test
------------
    make sure rebar3 is in you path and ...
    $ cd c_src
    $ make
    $ cd ..
    $ rebar3 shell
    > superport:start("priv/superport").
    > superport:foo(3).
    > superport:bar(3).
    > superport:baz(3).
    
