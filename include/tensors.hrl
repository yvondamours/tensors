
-record(n, {created,children}).
-define(N_BUCKET, <<"tensors_node">>).
-define(O_BUCKET, <<"tensors_tld">>).
-define(ORDER_DEFAULT, 250).
-define(BLOCK_DEFAULT, 1000000).
-define(HASH_LEN, 512).

-define(TIMEOUT_DEFAULT, 60000).

-define(fmt(S, As), lists:flatten(io_lib:format(S, As))).

-record(split, {head=[], midhead=[], middle=[], midtail=[], tail=[]}).

-ifdef(TEST).

-ifdef(DEBUG).
-undef(debugMsg).
-undef(debugFmt).
-define(debugMsg(S), error_logger:info_msg(S)).
-define(debugFmt(S, As), error_logger:info_msg(S,As)).
-else.
-undef(debugMsg).
-undef(debugFmt).
-define(debugMsg(S), ok).
-define(debugFmt(S, As), ok).
-endif.

-else.

-ifdef(DEBUG).
-define(debugMsg(S), error_logger:info_msg(S)).
-define(debugFmt(S, As), error_logger:info_msg(S,As)).
-else.
-define(debugMsg(S), ok).
-define(debugFmt(S, As), ok).
-endif.

-endif.
