-module(superport).

-export([start/1, stop/0, init/1]).
-export([foo/1, bar/1, baz/1]).

start(ExtPrg) ->
    spawn(?MODULE, init, [ExtPrg]).
stop() ->
    superport ! stop.

foo(X) ->
    call_port({foo, X}).
bar(Y) ->
    call_port({bar, Y}).
baz(Y) ->
    call_port({baz, Y}).

call_port(Msg) ->
    superport ! {call, self(), Msg},
    receive
	{superport, Result} ->
	    Result
    end.

init(ExtPrg) ->
    register(superport, self()),
    process_flag(trap_exit, true),
    Port = open_port({spawn, ExtPrg}, [{packet, 2}]),
    loop(Port).

loop(Port) ->
    receive
	{call, Caller, Msg} ->
	    Port ! {self(), {command, encode(Msg)}},
	    receive
		{Port, {data, Data}} ->
		    Caller ! {superport, decode(Data)}
	    end,
	    loop(Port);
	stop ->
	    Port ! {self(), close},
	    receive
		{Port, closed} ->
		    exit(normal)
	    end;
	{'EXIT', _Port, _Reason} ->
	    exit(port_terminated)
    end.

encode({foo, X}) -> [1, X];
encode({bar, Y}) -> [2, Y];
encode({baz, Y}) -> [3, Y].

decode([Int]) -> Int.
