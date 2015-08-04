defmodule Gitex.Caller do
  use GenServer
  import Logger

  @doc """
  executes a command
  """
  def execute(cmd, args \\ []) do
    GenServer.call(:caller, {:execute, [cmd, args]})
  end

  """
  GenServer implementation
  """

  @doc """
  start
  """
  def start_link do
    log(:debug, "start caller")
    GenServer.start(__MODULE__, nil, name: :caller)
  end

  @doc """
  handles execute calls
  """
  def handle_call({:execute, [cmd, args]}, _from, state) do
    {res, 0} = System.cmd(cmd, args)
    {:reply, String.strip(res), state}
  end
end
