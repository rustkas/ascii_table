-module(ascii_table_tests).

%-define(RESEARCH, true).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

-ifdef(RESEARCH).

print_table_test() ->
    ASCII_Table = ascii_table:ascii_table(),
    lists:foreach(fun(Elem) ->
                     case Elem of
                         {Dec, Hx, Oct, Regex, String, Description} ->
                             {Dec, Hx, Oct, Regex, String, Description} = Elem,
                             ?debugFmt("~p, ~p, ~p, ~p, ~p, ~p~n",
                                       [Dec, Hx, Oct, Regex, String, Description]);
                         {Dec, Hx, Oct, Regex, String} ->
                             {Dec, Hx, Oct, Regex, String} = Elem,
                             ?debugFmt("~p, ~p, ~p, ~p, ~p~n", [Dec, Hx, Oct, Regex, String]);
                         _ ->
                             true
                     end
                  end,
                  ASCII_Table).

-else.

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
                     {ok, {re_pattern, _, _, _, _}} = re:compile(RegularExpression),
                     true
                  end,
                  ASCII_Table).

check_hex_test() ->
    String = ascii_table:hex(31),
    ?assertEqual("16#1F", String).

-endif.
-endif.
