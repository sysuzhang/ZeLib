%% @author rongjie
%% @email zsuzhang(@)qq.com
%% @doc meta programming for erlang


-module(ze_mperl).

%% ====================================================================
%% API functions
%% ====================================================================
-export([eval/1, eval/2]).

eval(StringExpr) ->
    eval(StringExpr, []).
eval(StringExpr, Bindings) ->
    {ok,Tokens,_} = erl_scan:string(StringExpr),
    NewTokens =
        case lists:reverse(Tokens) of
            [{dot,_}|_] ->
                Tokens;
            RTokens -> 
                lists:reverse([{dot,1} | RTokens])
        end,
    {ok,Parsed} = erl_parse:parse_exprs(NewTokens),
    {value, Value,_} = erl_eval:exprs(Parsed,Bindings),
    Value.

%% ====================================================================
%% Internal functions
%% ====================================================================


