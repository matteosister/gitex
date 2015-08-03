defmodule Gitex.Repo do
  defstruct [
    path: nil,
    name: nil,
    binary: %Gitex.Binary{}
  ]
end
