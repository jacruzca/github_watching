defmodule GithubWatching.GithubApi do
  @moduledoc """
  This module contains functions to get data from the github api
  """

  import Logger
  alias GithubWatching.WatchingParams
  alias GithubWatching.Domain.User

  @user_fields """
    name
    login
  """

  @repository_fields """
    name
    url
    createdAt
  """

  @page_info_fields """
    endCursor
    startCursor
    hasNextPage
    hasPreviousPage
  """

  defp gql_helper, do: Application.get_env(:github_watching, :gql_helper)

  @doc """
  Return a list of paginated repositories that the given user is watching
  """
  @spec get_watching_repositories(String.t(), WatchingParams.t()) ::
          {:ok, User.t()} | {:error, Neuron.Response.t() | Neuron.JSONParseError.t()}
  def get_watching_repositories(username, params \\ %WatchingParams{}) do
    debug("Getting watching repos for user `#{username}` with params #{inspect(params)}")

    watching_params = params |> WatchingParams.build_watching_params()

    query =
      gql_helper().query("""
      {
        user(login:"#{username}"){
          #{@user_fields}
          watching(#{watching_params}){
            totalCount
            pageInfo{
              #{@page_info_fields}
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
      {:ok, %{user: nil}} -> {:error, :user_not_found}
      {:ok, %{user: user}} -> {:ok, User |> struct(user)}
      error -> error
    end
  end

  @spec get_starred_repositories(String.t(), WatchingParams.t()) ::
          {:ok, User.t()} | {:error, Neuron.Response.t() | Neuron.JSONParseError.t()}
  def get_starred_repositories(
        username,
        params \\ %WatchingParams{order_by: "{field: STARRED_AT, direction: ASC}"}
      ) do
    debug("Getting starred repos for user `#{username}` with params #{inspect(params)}")

    watching_params = params |> WatchingParams.build_watching_params()

    query =
      gql_helper().query("""
      {
        user(login:"#{username}"){
          #{@user_fields}
          starredRepositories(#{watching_params}){
            totalCount
            pageInfo{
              #{@page_info_fields}
            }
            edges{
              node{
                #{@repository_fields}
              }
              cursor
              starredAt
            }
          }
        }
      }
      """)

    case query do
      {:ok, %{user: nil}} -> {:error, :user_not_found}
      {:ok, %{user: user}} -> {:ok, User |> struct(user)}
      error -> error
    end
  end
end
