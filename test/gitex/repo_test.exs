defmodule Gitex.RepoTest do
  use ExUnit.Case, async: true
  doctest Gitex.Repo

  defp tmp_folder do
    System.tmp_dir() <> "/" <> random_string
  end

  defp random_string (l \\ 6) do
    Enum.reduce(1..l, "", fn (_, acc) -> acc <> random_char end)
  end

  defp random_char do
    chars = "abcdefghijklmnopqrstuwxyz"
    :random.seed(:os.timestamp)
    rnd = Float.ceil(:random.uniform * (String.length(chars) - 1))
    String.at chars, rnd
  end

  test "new repository" do
    Gitex.Repo.new(tmp_folder)
  end
end
