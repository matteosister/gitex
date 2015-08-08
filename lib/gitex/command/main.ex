defmodule Gitex.Command.Main do
  #import Logger

  @init "init"
  @add "add"
  @reset "reset"
  @commit "commit"

  @doc """
  init command

  iex> Gitex.Command.Main.init
  ["init"]

  iex> Gitex.Command.Main.init(true)
  ["init", "--bare"]
  """
  @spec init(boolean) :: []
  def init, do: [@init]
  def init(false), do: [@init]
  def init(_), do: [@init, "--bare"]

  @doc """
  add command

  iex> Gitex.Command.Main.add
  ["add", "--all", "."]

  iex> Gitex.Command.Main.add("test")
  ["add", "--all", "test"]
  """
  @spec add(binary) :: []
  def add(what \\ "."), do: [@add, "--all", what]

  @doc """
  unstage command

  iex> Gitex.Command.Main.unstage("test")
  ["reset", "HEAD", "test"]
  """
  @spec unstage(binary) :: []
  def unstage(what), do: [@reset, "HEAD", what]

  @doc """
  commit command

  iex> Gitex.Command.Main.commit("")
  ** (ArgumentError) commit message cannot be empty

  iex> Gitex.Command.Main.commit(nil)
  ** (ArgumentError) commit message cannot be empty

  iex> Gitex.Command.Main.commit("test message")
  ["commit", "-a", "-m", "test message"]

  iex> Gitex.Command.Main.commit("test message", false)
  ["commit", "-m", "test message"]

  iex> Gitex.Command.Main.commit("test message", false, nil, true)
  ["commit", "--allow-empty", "-m", "test message"]
  """
  @spec commit(binary) :: []
  @spec commit(binary, boolean) :: []
  @spec commit(binary, boolean, %Gitex.Author{}) :: []
  @spec commit(binary, boolean, %Gitex.Author{}, boolean) :: []
  def commit("") do
    raise ArgumentError, message: "commit message cannot be empty"
  end
  def commit(nil) do
     raise ArgumentError, message: "commit message cannot be empty"
   end
   def commit(message, stage_all \\ true, author \\ nil, allow_empty \\ false) do
     res = [@commit]
     if stage_all do
       res = res ++ ["-a"]
     end
     unless is_nil(author) do
       res = res ++ ["--author", author.name]
     end
     if allow_empty do
       res = res ++ ["--allow-empty"]
     end
     res = res ++ ["-m", message]
     res
   end
end
