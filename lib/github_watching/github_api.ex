defmodule GithubWatching.GithubApi do
  @moduledoc """
  This module contains functions to get data from the github api
  """

  import Logger

  @user_fields """
    email
    id
    name
  """

  @repository_fields """
    name
    url
  """

  defp api_key, do: Application.get_env(:github_watching, :api_key)
  defp endpoint, do: Application.get_env(:github_watching, :endpoint)

  defp init() do
    Neuron.Config.set(url: endpoint())

    Neuron.Config.set(
      headers: [
        Authorization: "Bearer #{api_key()}"
      ]
    )
  end

  defp query(body) do
    init()
    body |> Neuron.query()
  end

  @spec get_watching_repositories(String.t()) ::
          {:ok, Neuron.Response.t()} | {:error, Neuron.Response.t() | Neuron.JSONParseError.t()}
  def get_watching_repositories(username) do
    debug("Getting watching repos for user #{username}")

    query("""
    {
      user(login:"#{username}"){
        #{@user_fields}
        watching(first: 10){
          nodes{
            #{@repository_fields}
          }
        }
      }
    }
    """)
  end
end
