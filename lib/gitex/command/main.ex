defmodule Gitex.Command.Main do
  #import Logger

  @init "init"
  @add "add"
  @reset "reset"
  @commit "commit"
  @status "status"

  @doc """
  init command

      iex> Gitex.Command.Main.init
      ["init"]

      iex> Gitex.Command.Main.init(true)
      ["init", "--bare"]
  """
  @spec init(boolean) :: [binary]
  def init(bare \\ false)
  def init(false), do: [@init]
  def init(true), do: [@init, "--bare"]

  @doc """
  add command

      iex> Gitex.Command.Main.add
      ["add", "--all", "."]

      iex> Gitex.Command.Main.add("test")
      ["add", "--all", "test"]
  """
  @spec add(binary) :: [binary]
  def add(what \\ "."), do: [@add, "--all", what]

  @doc """
  unstage command

      iex> Gitex.Command.Main.unstage("test")
      ["reset", "HEAD", "test"]
  """
  @spec unstage(binary) :: [binary]
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
  @spec commit(binary) :: [binary]
  @spec commit(binary, boolean) :: [binary]
  @spec commit(binary, boolean, %Gitex.Author{}) :: [binary]
  @spec commit(binary, boolean, %Gitex.Author{}, boolean) :: [binary]
  def commit(message) when message == "" or is_nil(message) do
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

  @doc """
  status command

      iex> Gitex.Command.Main.status
      ["-c", "color.status=false", "status", "--porcelain"]
  """
  def status do
    ["-c", "color.status=false", @status, "--porcelain"]
  end
end
