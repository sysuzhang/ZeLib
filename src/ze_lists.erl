%% @author rongjie
%% @email zsuzhang@qq.com
%% @doc @todo Add description to ze_lists.


-module(ze_lists).

%% ====================================================================
%% API functions
%% ====================================================================
-export([unique/1]).
-export([keyunique/2]).


unique(List) ->
    sets:to_list(sets:from_list(List)).

keyunique(Keypos, TupleList) ->
    keyunique(Keypos, TupleList, orddict:new()).

keyunique(_Keypos, [], Result) ->
    ze_orddict:to_valuelist(Result);
keyunique(Keypos, [Tuple|List], Result) ->
    Key = ze_tuple:nth(Keypos, Tuple),
    case orddict:find(Key, Result) of
        error ->
            keyunique(Keypos, List, orddict:store(Keypos, Tuple, Result));
        _ ->
            keyunique(Keypos, List, Result)
    end.
    
    


%% ====================================================================
%% Internal functions
%% ====================================================================


