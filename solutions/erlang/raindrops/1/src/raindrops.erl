-module(raindrops).

-export([convert/1]).


pling(N) when N rem 3 == 0 -> "Pling";
pling(_)                   -> "".

plang(N) when N rem 5 == 0 -> "Plang";
plang(_)                   -> "".

plong(N) when N rem 7 == 0 -> "Plong";
plong(_)                   -> "".

convert(Number) ->
  Sounds = pling(Number) ++ plang(Number) ++ plong(Number),
  case Sounds of
    "" -> integer_to_list(Number);
    _  -> Sounds
  end.
