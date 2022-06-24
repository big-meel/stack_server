defmodule StackServer.StackTest do
  use ExUnit.Case, async: true
  alias StackServer.Stack, as: Stack
  doctest StackServer.Stack

  test "read stack" do
    stack = [1, 2]
    assert [1, 2] = Stack.read(stack)
  end

  test "pop stack" do
    stack = [1, 2, 3]
    stack = Stack.pop(stack)
    assert [2, 3] = Stack.read(stack)
  end

  test "push element to stack" do
    stack = [4, 5]
    stack = Stack.push(stack, 2)
    assert [2, 4, 5] = Stack.read(stack)
  end

  test "only pops last element in stack and pushes new element to top" do
    stack = [5]
    stack = Stack.push(stack, 4)
    stack = Stack.push(stack, 3)

    assert [3, 4, 5] = Stack.read(stack)
    stack = Stack.pop(stack)
    assert [4, 5] = Stack.read(stack)
  end
end
