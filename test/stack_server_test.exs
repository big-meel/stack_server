defmodule StackServerTest do
  use ExUnit.Case, async: true
  doctest StackServer

  # test "greets the world" do
  #   assert StackServer.hello() == :world
  # end

  setup do
    stack = start_supervised!(StackServer)
    %{stack: stack}
  end

  test "Spawns stack", %{stack: stack} do
    assert [] = StackServer.read(stack)
  end

  test "Add elements to the stack", %{stack: stack} do
    assert [] = StackServer.read(stack)
    StackServer.push(stack, 5)
    assert [5] = StackServer.read(stack)
    StackServer.push(stack, 1)
    assert [1, 5] = StackServer.read(stack)
  end

  test "Remove top element from stack", %{stack: stack} do
    assert [] = StackServer.read(stack)
    StackServer.push(stack, 5)
    StackServer.push(stack, 1)
    assert [1, 5] = StackServer.read(stack)
    StackServer.pop(stack)
    assert [5] = StackServer.read(stack)
  end
end
