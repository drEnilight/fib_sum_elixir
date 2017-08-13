defmodule FibonacciSumSpec do
  use ESpec

  describe "has correct result" do
    it do: expect(FibonacciSum.solution(4)) |> to(eq 2)
    it do: expect(FibonacciSum.solution(12)) |> to(eq 10)
    it do: expect(FibonacciSum.solution(100)) |> to(eq 44)
  end

  describe "get exception" do
    it do: expect(fn -> FibonacciSum.solution({1,2,3}) end) |> to(raise_exception FunctionClauseError)
    it do: expect(fn -> FibonacciSum.solution("hello") end) |> to(raise_exception FunctionClauseError)
    it do: expect(fn -> FibonacciSum.solution(-3) end) |> to(raise_exception FunctionClauseError)
    it do: expect(fn -> FibonacciSum.solution(0) end) |> to(raise_exception FunctionClauseError)
    it do: expect(fn -> FibonacciSum.solution(7.3) end) |> to(raise_exception FunctionClauseError)
  end
end
