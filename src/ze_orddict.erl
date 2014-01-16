%% @author rongjie
%% @email zsuzhang@qq.com
%% @doc @todo Add description to ze_orddict.


-module(ze_orddict).

%% ====================================================================
%% API functions
%% ====================================================================
-export([to_valuelist/1, to_keylist/1]).


%% dict to Value list 
to_valuelist(Dict) ->
    dict:fold(fun(_Key,Value,List) ->
        lists:append(List, [Value])                   
    end, [], Dict).

to_keylist(Dict) ->
    dict:fold(fun(Key,_Value,List) ->
        lists:append(List, [Key])                     
    end, [], Dict).
%% ====================================================================
%% Internal functions
%% ====================================================================


