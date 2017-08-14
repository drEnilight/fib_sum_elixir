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

  @spec solution(integer) :: integer
  def solution(last_number) when is_correct_number(last_number) do
    last_number
      |> element_number
      |> next_fib_element
      |> sum_fib_elements
      |> even_only
  end

  @spec element_number(integer) :: integer
  def element_number(last_number) when is_correct_number(last_number) do
    :math.log(last_number * :math.sqrt(5) + 0.5) / :math.log(fi) |> trunc
  end

  @spec sum_fib_elements(integer) :: integer
  def sum_fib_elements(n) when is_integer(n) do
    s_element = (:math.pow(fi, n) - (-:math.pow(fi, -n))) / (2 * fi - 1) |> round
    s_element - 1
  end

  @spec next_fib_element(integer) :: integer
  defp next_fib_element(n) do
    case rem(n, 3) do
      2 -> n
      1 -> n + 1
      0 -> n + 2
    end
  end

  @spec even_only(integer) :: integer
  defp even_only(elements_sum) do
    elements_sum / 2 |> trunc
  end

  defp fi do
    (1 + :math.sqrt(5)) / 2
  end
end
