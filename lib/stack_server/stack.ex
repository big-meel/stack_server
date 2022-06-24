defmodule StackServer.Stack do
  def push(list, element) do
     [element | list]
  end

  def pop(list) do
    [ _head | list ] = list
    list
  end

  def read(list) do
    list
  end
end
