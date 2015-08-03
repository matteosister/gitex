defmodule Gitex.Caller do
  use GenServer
  import Logger

  def start_link do
    log(:debug, "start caller")
    GenServer.start(__MODULE__, nil, name: :caller)
  end

  def execute(cmd, args \\ []) do
    GenServer.call(:caller, {:execute, [cmd, args]})
  end

  def handle_call({:execute, [cmd, args]}, _from, state) do
    {res, 0} = System.cmd(cmd, args)
    {:reply, String.strip(res), state}
  end
end
