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
    ok.





%% ====================================================================
%% Internal functions
%% ====================================================================


