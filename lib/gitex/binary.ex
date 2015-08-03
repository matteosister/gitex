defmodule Gitex.Binary do
  defstruct path: nil
  import System
  import Gitex.Caller

  @doc """
  iex> Gitex.Binary.guess_binary
  "/usr/bin/git"
  """
  def guess_binary do
    execute("which", ["git"])
  end
end
