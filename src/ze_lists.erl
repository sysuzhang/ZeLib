%% @author rongjie
%% @email zsuzhang(@)qq.com
%% @doc @todo Add description to ze_lists.


-module(ze_lists).

%% ====================================================================
%% API functions
%% ====================================================================
-export([unique/1]).
-export([keyunique/2]). 
-export([pair_list/1]).
-export([store/3, replace/3]).

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
    
pair_list(List) ->
    tuple_list(2, List).

tuple_list(N, List) ->
   tuple_list(N, List, []).

tuple_list(N, List, Result) ->
    tuple_list(N, List, Result, 0, []).

tuple_list(_N, [], Result, _Seq, []) ->
    lists:reverse(Result);
tuple_list(N, List, Result, Seq, ElementList) when Seq >= N ->
    Tuple = list_to_tuple(lists:reverse(ElementList)),
    tuple_list(N, List, [Tuple|Result], 0, []);
tuple_list(N, [H|List], Result, Seq, ElementList) when Seq < N->
    tuple_list(N, List, Result, Seq + 1, [H|ElementList]).

store(Fun, List, NewElem) ->
     store(Fun, List, NewElem, false, []).

store(_Fun, [], NewElem, RepalceFlag, Result) ->
     if RepalceFlag =:= true ->
            Result;
        true ->
            [NewElem|Result]
     end;
store(Fun, [H|T], NewElem, RepalceFlag, Result) ->
    case Fun(H) of
        true ->
            store(Fun, T, NewElem, true, [NewElem|Result]);
        _ ->
            store(Fun, T, NewElem, RepalceFlag, [H|Result])
    end.

replace(Fun, List, NewElem) ->
    lists:map(fun(E) ->
                        case Fun(E) of
                            true ->
                                NewElem;
                            _ ->
                                E
                        end
                end, List).



%% ====================================================================
%% Internal functions
%% ====================================================================


