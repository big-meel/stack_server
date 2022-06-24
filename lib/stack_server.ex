defmodule StackServer do
  use GenServer
  alias StackServer.Stack, as: Stack
  @moduledoc """
  Documentation for `StackServer`.
  """
  def init(:ok) do
    {:ok, []}
  end

  def handle_call(:read, _from, list) do
    { :reply, list, list }
  end

  def handle_cast({:push, element}, list) do
    { :noreply, Stack.push(list, element) }
  end

  def handle_cast(:pop, list) do
    { :noreply, Stack.pop(list) }
  end

  ## Client API
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def read(server) do
    GenServer.call(server, :read)
  end

  def push(server, element) do
    GenServer.cast(server, {:push, element})
  end

  def pop(server) do
    GenServer.cast(server, :pop)
  end

end
