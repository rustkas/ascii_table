-module(ascii_table_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

get_table_test() ->
    ASCII_Table = ascii_table:ascii_table(),
    true = is_list(ASCII_Table).

check_table_size_test() ->
    ASCII_Table = ascii_table:ascii_table(),
    ?assertEqual(127 + 1, length(ASCII_Table)).

check_tuples_test() ->
    ASCII_Table = ascii_table:ascii_table(),
    true =
        lists:all(fun(Tuple) -> is_tuple(Tuple) andalso tuple_size(Tuple) >= 5 end,
                  ASCII_Table).

check_regular_expressions_test() ->
    ASCII_Table = ascii_table:ascii_table(),
    true =
        lists:all(fun(Tuple) ->
                     RegularExpression = element(4, Tuple),
					 %?debugFmt("~p~n", [RegularExpression]),
                     {ok, {re_pattern,_,_,_,_}} = re:compile(RegularExpression),
					true
                  end,
                  ASCII_Table).

-endif.
