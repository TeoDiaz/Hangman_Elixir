defmodule PatternMatch do
  def swap({a, b}), do: {b.a}
  def equal(a, a), do: true
  def equal(_, _), do: false
end

defmodule Lists do
  def len([]), do: 0
  def len([_h | t]), do: 1 + len(t)

  def sum([]), do: 0
  def sum([h | t]), do: h + sum(t)

  def sum_pairs([]), do: []
  def sum_pairs([h1, h2 | t]), do: [h1 + h2 | sum_pairs(t)]

  def double([]), do: []
  def double([h | t]), do: [2 * h | double(t)]

  def square([]), do: []
  def square([h | t]), do: [h * h | square(t)]

  def map([], _func), do: []

  def map([h | t], func) do
    [func.(h) | map(t, func)]
  end

  # Lists.map([1,2,3], fn x -> x*x*x end)
  # Lists.map([1,2,3], &(&1*&1*&1)) Anonymous

  #Write a function even_length? that uses pattern matching only to return false if the list you pass it has an odd number of elements, true otherwise.
  def even_length?([]) do
    true
  end

  def even_length?([_head | tail]) do
    !even_length?(tail)
  end
end
