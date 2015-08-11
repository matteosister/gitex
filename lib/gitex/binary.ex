defmodule Gitex.Binary do
  defstruct path: nil

  import Gitex.Caller

  @doc """
  creates a respository

      iex> Gitex.Binary.new
      %Gitex.Binary{path: "/usr/bin/git"}

      iex> Gitex.Binary.new("/bin/test")
      %Gitex.Binary{path: "/bin/test"}
  """
  def new(binary_path \\ nil)
  def new(nil), do: %Gitex.Binary{path: guess_binary}
  def new(binary_path), do: %Gitex.Binary{path: binary_path}

  defp guess_binary do
    execute("which", ["git"])
  end
end
