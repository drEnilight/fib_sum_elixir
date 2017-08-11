defmodule FibonacciSum do
  def solution_1 do
    stream = Stream.unfold({1, 2}, fn({n, m}) -> cond do
                                                  n > 4_000_000 -> nil
                                                  true          -> {n, {m, n + m}}
                                                 end
                                   end)
    Enum.reduce(stream, 0, fn(num, acc) -> cond do
                                            rem(num, 2) == 0 -> acc + num
                                            true             -> acc
                                           end
                           end)
  end

  def solution(last_number) do
    fi = (1 + :math.sqrt(5)) / 2
    n = :math.log(last_number * :math.sqrt(5) + 0.5) / :math.log(fi) |> round
    n = n + 2
    s_element = (:math.pow(fi, n) - (-:math.pow(fi, -n))) / (2 * fi - 1) |> round
    sum_all_elem = s_element - 1
    sum_even_numbers = sum_all_elem / 2
  end
end
