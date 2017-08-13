defmodule FibonacciSum do
  defmacro is_correct_number(number) do
    quote do: is_integer(unquote(number)) and unquote(number) > 0
  end

  def get_result(last_number) when is_correct_number(last_number) do
    stream = Stream.unfold({1, 2}, fn({n, m}) -> cond do
                                                  n > last_number -> nil
                                                  true            -> {n, {m, n + m}}
                                                 end
                                   end)
    Enum.reduce(stream, 0, fn(num, acc) -> cond do
                                            rem(num, 2) == 0 -> acc + num
                                            true             -> acc
                                           end
                           end)
  end

  def solution(last_number) when is_correct_number(last_number) do
    fi = (1 + :math.sqrt(5)) / 2
    n = :math.log(last_number * :math.sqrt(5) + 0.5) / :math.log(fi) |> trunc
    n = case rem(n, 3) do
          2 -> n
          1 -> n + 1
          0 -> n + 2
        end
    s_element = (:math.pow(fi, n) - (-:math.pow(fi, -n))) / (2 * fi - 1) |> round
    sum_all_elem = s_element - 1
    sum_all_elem / 2 |> trunc
  end
end
