%% @author rongjie
%% @email zsuzhang(@)qq.com
%% @doc @todo Add description to ze_lists.


-module(ze_lists).

%% ====================================================================
%% API functions
%% ====================================================================
-export([unique/1]).
-export([keyunique/2]). 


%% unique(List) -> 
%%     unique(List, []).
%% unique([], List) ->
%%     [erlang:erase({ze_lists, Key}) || Key <- List],
%%     lists:reverse(List);
%% unique([H|Tail], List) ->
%%     case erlang:put({ze_lists, H}, H) of
%%         undefined ->
%%             unique(Tail, [H|List]);
%%         _OldVal ->
%%             unique(Tail, List)
%%     end.
%% 

%% unique(List) ->
%% 	sets:to_list(sets:from_list(List)).

unique(List) ->
	lists:usort(List).

%% keyunique(Keypos, TupleList) ->
%%     keyunique(Keypos, TupleList, orddict:new()).
%% keyunique(_Keypos, [], Result) ->
%%     ze_orddict:to_valuelist(Result);
%% keyunique(Keypos, [Tuple|List], Result) ->
%%     Key = ze_tuple:nth(Keypos, Tuple),
%%     keyunique(Keypos, List, orddict:store(Key, Tuple, Result)).

keyunique(Keypos, TupleList) ->
	lists:ukeysort(Keypos, TupleList).
    


%% ====================================================================
%% Internal functions
%% ====================================================================


