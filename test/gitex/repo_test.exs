defmodule Gitex.RepoTest do

  use ExUnit.Case, async: true
  doctest Gitex.Repo

  alias Gitex.Repo

  @doc """
  creates a respository
  """
  def create_repo do
    Gitex.Repo.new(tmp_folder)
  end

  defp tmp_folder do
    System.tmp_dir() <> "/" <> random_string
  end

  defp random_string(l \\ 6, prefix \\ "gitex") do
    "#{ prefix }_#{ Enum.reduce(1..l, "", fn (_, acc) -> acc <> random_char end) }"
  end

  defp random_char do
    chars = "abcdefghijklmnopqrstuwxyz"
    :random.seed(:os.timestamp)
    rnd = Float.ceil(:random.uniform * (String.length(chars) - 1))
    String.at chars, rnd
  end

  test "respository is a map" do
    repo = create_repo
    assert is_map(repo)
  end

  test "respository is initializable" do
    repo = create_repo
    Repo.init(repo)
    assert 1 == 1
  end

end
