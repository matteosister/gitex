defmodule Gitex.Binary do
  defstruct path: nil

  import System
  import Gitex.Caller

  @doc """
  iex> Gitex.Binary.create_from_binary
  %Gitex.Binary{path: "/usr/bin/git"}

  iex> Gitex.Binary.create_from_binary("/bin/test")
  %Gitex.Binary{path: "/bin/test"}
  """
  def create_from_binary(binary_path \\ nil)
  def create_from_binary(nil), do: %Gitex.Binary{path: guess_binary}
  def create_from_binary(binary_path), do: %Gitex.Binary{path: binary_path}

  @doc """
  iex> Gitex.Binary.guess_binary
  "/usr/bin/git"
  """
  defp guess_binary do
    execute("which", ["git"])
  end
end
