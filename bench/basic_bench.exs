defmodule BasicBench do
  use Benchfella

  bench "fib sum by formulas" do
    FibonacciSum.solution(4_000_000)
  end

  bench "fib sum with stream" do
    FibonacciSum.get_result(4_000_000)
  end
end
