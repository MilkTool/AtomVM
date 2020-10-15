-module(ceilint).

-export([start/0, id/1]).

start() ->
    to_int(add(id(3), id(-2))).

add(A, B) ->
    id(A) + id(B).

to_int(A) ->
    id(ceil(id(A))).

id(I) ->
    I.
