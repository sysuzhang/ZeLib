-ifndef(ZE_LIB_HRL_FILE).
-define(ZE_LIB_HRL_FILE, ze_lib_hrl_file).

-ifndef(IF).
-define(IF(B,T,F), (case (B) of true->(T); false->(F) end)).
-endif.


-define(UTC_TO_LTC_DIFF,       8).
-define(SECONDS_OF_MINUTE,      60).
-define(SECONDS_OF_HOUR,        3600).
-define(SECONDS_OF_DAY,         86400).
-define(MAX_INTEGER,            999999999).
-define(MAX_LONG_TIME,          2999999999).

-define(GREGORIAN_LOCAL_TIME_DIFF, 62167219200). %%gregorian时间系统与Local时间系统的差值

-endif.