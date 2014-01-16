%% @author rongjie
%% @doc @todo Add description to lists_test.


-module(lists_test).
-import(ze_lists, [unique/1, keyunique/2]).
-include_lib("eunit/include/eunit.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-compile(export_all).


unique_test() ->
    ?assertEqual(unique([1,2,1,2,3,6]), [1,2,3,6]),
	?assertEqual(unique([{a,b,c}, {1,2,3}, {d,e,f}]), [{1,2,3}, {a,b,c}, {d,e,f}]),
    ok.

keyunique_test() ->
	?assertEqual(keyunique(1, [{a,b,c}, {1,2,3}, {d,a,f}]), [{1,2,3}, {a,b,c}, {d,a,f}]),
	ok.
 

%% ====================================================================
%% Internal functions
%% ====================================================================


