defmodule Gitex.Repo do
  require Gitex.Command

  defstruct [
    path: nil,
    name: nil,
    binary: %Gitex.Binary{}
  ]

  def new(path) do
    %Gitex.Repo{ path: path, binary: Gitex.Binary.new }
  end

  def init(%Gitex.Repo{path: path}) do
    Gitex.Command.run(Gitex.Command.Main.init)
  end
end
