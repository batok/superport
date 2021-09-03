superport
=====

An erlang port example

Build
-----

    $ rebar3 compile

Run and Test
------------
    $ cd c_src
    $ make
    $ rebar3 shell
    > superport:start("priv/superport").
    > superport:foo(3).
    > superport:bar(3).
    > superport:baz(3).
    
