-module(collatz_conjecture).

-export([steps/1]).

steps(1) -> 0;
steps(N) when N =< 0 -> error(badarg);
steps(N) ->
  1 + steps(
        if N rem 2 == 0 -> N div 2;
        true            -> N * 3 + 1
      end).
