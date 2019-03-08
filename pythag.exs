


# The simple way of looking for triples is to generate all
# combinations of integers between 1 and 100, and test each to see if
# it is a triple


for a <- 1..100, b <- 1..100, c <- 1..100, a*a + b*b == c*c, do: [a, b, c]

# We can use Erlang's `timer` library to see how long this takes:

:timer.tc(fn ->
  for a <- 1..100, b <- 1..100, c <- 1..100, a*a + b*b == c*c, do: [a, b, c]
end) |> IO.inspect

:timer.tc(fn ->
  for a <- 1..100,
      b <- (a+1)..100,
      c <- (b+1)..100,
      a*a + b*b == c*c,
  do: [a, b, c]
end) |> IO.inspect
