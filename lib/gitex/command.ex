defmodule Gitex.Command do
  @init "init"

  @doc """
  init command

  iex> Gitex.Command.init
  ["init"]

  iex> Gitex.Command.init(true)
  ["init", "--bare"]
  """
  def init(bare \\ false)
  def init(false), do: [@init]
  def init(true), do: [@init, "--bare"]
end
