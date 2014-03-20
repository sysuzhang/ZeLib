%% @author rongjie
%% zsuzhang (@) qq.com
%% @doc @todo Add description to ze_time.


-module(ze_time).
-include("../include/ze_lib.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([get_timestamp/0, get_longtimestamp/0]).
-export([get_datetime_timestamp/1, get_timestamp_datetime/1]).
-export([get_timestamp_year_month_day/1]).
-export([str_timestamp/1]).
-export([weekday/0, weekday/1,
         midnight/0, midnight/1,
         next_midnight/0, next_midnight/1,
         next_weekday_timestamp/1, 
         next_month_firstmidnight/0, next_month_firstmidnight/1]).

%% for replace erlang:now(), because of erlang:now() function has performance problem
%% 取得当前的时间戳
get_timestamp() ->
    {M, S, _} = os:timestamp(),
    M * 1000000 + S.

get_longtimestamp() ->
    {M, S, Ms} = os:timestamp(),
    M * 1000000000 + S*1000 + Ms div 1000.

    


%% 取本地标准时间对应的时间戳
get_datetime_timestamp({{Y, M, D}, {HH, MM, SS}}) ->
    [UtcDataTime] = calendar:local_time_to_universal_time_dst({{Y, M, D}, {HH, MM, SS}}),
    xengine_time:datetime_to_timestamp(UtcDataTime).

%% 取时间戳对应的本地标准时间
get_timestamp_datetime(TimeStamp) ->
    UtcDataTime = xengine_time:timestamp_to_datetime(TimeStamp),
    calendar:universal_time_to_local_time(UtcDataTime).

str_timestamp(TimeStamp) ->
    {{Y, M, D}, {HH, MM, SS}} = get_timestamp_datetime(TimeStamp),
    io_lib:format("~B-~B-~B ~B:~B:~B", [Y, M, D, HH, MM, SS]).

get_timestamp_year_month_day(TimeStamp) ->
    {{Y, M, D}, {_HH, _MM, _SS}} = get_timestamp_datetime(TimeStamp),
    {Y,M,D}.

get_datetime() ->
    get_timestamp_datetime(get_timestamp()).

%% 指定时间的凌晨0点的time
midnight(TimeStamp) ->
    {_Date, Time} = get_timestamp_datetime(TimeStamp),  
    TimeStamp - calendar:time_to_seconds(Time).

%% 今天凌晨0点的time
midnight() ->
    midnight(get_timestamp()).

%% 明天开始的时间
next_midnight() ->
    midnight() + ?SECONDS_OF_DAY.

next_midnight(TimeStamp) ->
    midnight(TimeStamp) + ?SECONDS_OF_DAY.

next_month_firstmidnight() ->
    next_month_firstmidnight(get_timestamp()).
next_month_firstmidnight(TimeStamp) ->
    {{Y, M, D}, _} = get_timestamp_datetime(TimeStamp), 
    midnight(TimeStamp) + ?SECONDS_OF_DAY * (calendar:last_day_of_the_month(Y, M)-D+1).

weekday() ->
    {{Year, Month, Day}, {_HH, _MM, _SS}} = get_datetime(),
    calendar:day_of_the_week(Year, Month, Day).

weekday(TimeStamp) -> 
    {{Year, Month, Day}, {_HH, _MM, _SS}} = get_timestamp_datetime(TimeStamp),
    calendar:day_of_the_week(Year, Month, Day).

next_weekday_timestamp(WeekDay) ->
    Diff = WeekDay - weekday() + ?DAY_OF_WEEK,
    midnight() + Diff * ?SECONDS_OF_DAY.

%% ====================================================================
%% Internal functions
%% ====================================================================


