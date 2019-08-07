defmodule GithubWatching.GithubApi do
  @moduledoc """
  This module contains functions to get data from the github api
  """

  import Logger

  defp api_key, do: Application.get_env(:github_watching, :api_key)

  def get_watching_repositories(username) do
    info("The api key is #{api_key()}")
    {:ok, []}
  end
end
