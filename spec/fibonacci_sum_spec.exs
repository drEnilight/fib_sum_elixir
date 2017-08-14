defmodule FibonacciSumSpec do
  use ESpec

  describe "has correct result" do
    it do: expect(FibonacciSum.solution(4)) |> to(eq 2)
    it do: expect(FibonacciSum.solution(12)) |> to(eq 10)
    it do: expect(FibonacciSum.solution(100)) |> to(eq 44)
  end

  describe "has correct fibonacci sequence number" do
    it do: expect(FibonacciSum.element_number(5)) |> to(eq 5)
    it do: expect(FibonacciSum.element_number(25)) |> to(eq 8)
    it do: expect(FibonacciSum.element_number(55)) |> to(eq 10)
  end

  describe "has the correct sum of fibonacci elements" do
    it do: expect(FibonacciSum.sum_fib_elements(6)) |> to(eq 7)
    it do: expect(FibonacciSum.sum_fib_elements(8)) |> to(eq 20)
    it do: expect(FibonacciSum.sum_fib_elements(10)) |> to(eq 54)
  end

  describe "get exception" do
    it do: expect(fn -> FibonacciSum.solution({1,2,3}) end) |> to(raise_exception FunctionClauseError)
    it do: expect(fn -> FibonacciSum.solution("hello") end) |> to(raise_exception FunctionClauseError)
    it do: expect(fn -> FibonacciSum.solution(-3) end) |> to(raise_exception FunctionClauseError)
    it do: expect(fn -> FibonacciSum.solution(0) end) |> to(raise_exception FunctionClauseError)
    it do: expect(fn -> FibonacciSum.solution(7.3) end) |> to(raise_exception FunctionClauseError)
  end
end
