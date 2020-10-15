-module(test_list_tuple_eq).

-export([start/0, id/1, make_list/1, factorial/1]).

start() ->
    N = factorial(id(0)) - 1,
    bool_to_n(
        make_list(id(N)) ==
            [
                {1, 1, test, 2},
                {1, 1, test, 2},
                {1, test, 2, 2},
                {1, test, [6], 2},
                {1, test, [{[24]}, test], 2}
            ]
    ) +
        bool_to_n(
            make_list(id(N)) ==
                [
                    {1, 1, test, 2},
                    {1, 1, test, 2},
                    {1, test, 2, 2},
                    {1, test, [6], 2},
                    {1, test, [{[25]}, test], 2}
                ]
        ) * 2 +
        bool_to_n(
            make_list(id(N)) ==
                [
                    {1, 1, test, 2},
                    {1, 1, test, 2},
                    {1, test, 2, 2},
                    {1, test, [6], 2},
                    {1, test, [{[24], [[7]]}, test], 2}
                ]
        ) * 4.

make_list(N) ->
    [
        {factorial(N), 1, test, 2},
        {1, factorial(N + 1), test, 2},
        {1, test, 2, factorial(N + 2)},
        {1, test, [factorial(N + 3)], 2},
        {1, test, [{[factorial(N + 4)]}, test], 2}
    ].

factorial(0) -> 1;
factorial(N) -> N * factorial(N - 1).

id(N) ->
    N.

bool_to_n(true) ->
    1;
bool_to_n(false) ->
    0.
