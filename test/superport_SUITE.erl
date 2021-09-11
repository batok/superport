-module(superport_SUITE).
-type config() :: [{atom(), term()}].

-export([ all/0]).
-export([ init_per_suite/1
        , end_per_suite/1
        ]).
-export([ func_tests/1]).

-spec all() -> [atom()].
all() -> [func_tests].

-spec init_per_suite(config()) -> config().
init_per_suite(Config) ->
  Path = filename:join([code:priv_dir(superport), "superport"]),
  _Port = superport:start(Path),
  Config.

-spec end_per_suite(config()) -> config().
end_per_suite(Config) ->
  superport:stop(),
  Config.

-spec func_tests(config()) -> {comment, []}.
func_tests(_Config) ->
  4 = superport:foo(3),  
  6 = superport:bar(3),
  0 = superport:baz(3),
  5 = superport:sum(3,2).
  
