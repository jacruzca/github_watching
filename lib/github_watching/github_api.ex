defmodule GithubWatching.GithubApi do
  @moduledoc """
  This module contains functions to get data from the github api
  """

  import Logger
  alias GithubWatching.WatchingParams
  alias GithubWatching.Helpers.GqlHelper
  alias GithubWatching.Domain.User

  @user_fields """
    name
    login
  """

  @repository_fields """
    name
    url
  """

  @doc """
  Return a list of paginated repositories that the given user is watching
  """
  @spec get_watching_repositories(String.t(), WatchingParams.t()) ::
          {:ok, User.t()} | {:error, Neuron.Response.t() | Neuron.JSONParseError.t()}
  def get_watching_repositories(username, params \\ %WatchingParams{}) do
    debug("Getting watching repos for user `#{username}` with params #{inspect(params)}")

    watching_params = params |> WatchingParams.build_watching_params()

    query =
      GqlHelper.query("""
      {
        user(login:"#{username}"){
          #{@user_fields}
          watching(#{watching_params}){
            totalCount
            pageInfo{
              endCursor
              hasNextPage
            }
            edges{
              node{
                #{@repository_fields}
              }
              cursor
            }
          }
        }
      }
      """)

    case query do
      {:ok, %{user: user}} -> {:ok, User |> struct(user)}
      error -> error
    end
  end
end
