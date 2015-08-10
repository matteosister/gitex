defmodule Gitex.Repo do
  defstruct [
    path: nil,
    name: nil,
    binary: %Gitex.Binary{}
  ]

  def new(path) do
    %Gitex.Repo{path: path}
  end
end
