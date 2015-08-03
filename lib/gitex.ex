defmodule Gitex do
  use Application

  def start(_type, _args) do
    Gitex.Supervisor.start_link
  end
end
