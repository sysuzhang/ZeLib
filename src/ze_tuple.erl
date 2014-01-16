%% @author rongjie
%% @email zsuzhang@qq.com
%% @doc @todo Add description to ze_tuple.


-module(ze_tuple).

%% ====================================================================
%% API functions
%% ====================================================================
-export([nth/2]).

nth(Pos, Tuple) ->
    List = tuple_to_list(Tuple),
    lists:nth(Pos, List).

%% ====================================================================
%% Internal functions
%% ====================================================================


