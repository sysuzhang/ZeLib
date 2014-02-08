%% @author rongjie
%% @email zsuzhang(@).com
%% @doc @todo Add description to ze_tuple.


-module(ze_tuple).

%% ====================================================================
%% API functions
%% ====================================================================
-export([nth/2]).

nth(Pos, Tuple) ->
    erlang:element(Pos, Tuple).

%% ====================================================================
%% Internal functions
%% ====================================================================


