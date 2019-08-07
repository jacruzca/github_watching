defmodule GithubWatching.GithubApiTest do
  use ExUnit.Case, async: true
  alias GithubWatching.GithubApi
  alias GithubWatching.Domain.User
  import Mox

  # Make sure mocks are verified when the test exits
  setup :verify_on_exit!

  describe "get watching repos from user" do
    test "it returns a user with watching repositories given a valid username" do
      name = "Jhon"
      login = "jacruzca"
      watching = %{edges: [%{cursor: "AB", node: %{name: "repo", url: "url"}}]}

      GqlHelperBehaviourMock
      |> expect(:query, fn _body ->
        {:ok, %{user: %{name: name, login: login, watching: watching}}}
      end)

      assert {:ok, %User{name: name, login: login} = user} =
               GithubApi.get_watching_repositories(login)

      assert 1 = length(user.watching.edges)
    end

    test "it returns error given a non-existent username" do
      GqlHelperBehaviourMock
      |> expect(:query, fn _body ->
        {:ok, %{user: nil}}
      end)

      assert {:error, :user_not_found} = GithubApi.get_watching_repositories("invalid_user")
    end

    test "it returns error when something wrong happens with gql" do
      GqlHelperBehaviourMock
      |> expect(:query, fn _body ->
        {:error, :any_error}
      end)

      assert {:error, _} = GithubApi.get_watching_repositories("error")
    end
  end

  describe "get starred repos from user" do
    test "it returns a user with starred repositories given a valid username" do
      name = "Jhon"
      login = "jacruzca"
      starred_repositories = %{edges: [%{cursor: "AB", node: %{name: "repo", url: "url"}}]}

      GqlHelperBehaviourMock
      |> expect(:query, fn _body ->
        {:ok, %{user: %{name: name, login: login, starredRepositories: starred_repositories}}}
      end)

      assert {:ok, %User{name: name, login: login} = user} =
               GithubApi.get_starred_repositories(login)

      assert 1 = length(user.starredRepositories.edges)
    end

    test "it returns error given a non-existent username" do
      GqlHelperBehaviourMock
      |> expect(:query, fn _body ->
        {:ok, %{user: nil}}
      end)

      assert {:error, :user_not_found} = GithubApi.get_starred_repositories("invalid_user")
    end

    test "it returns error when something wrong happens with gql" do
      GqlHelperBehaviourMock
      |> expect(:query, fn _body ->
        {:error, :any_error}
      end)

      assert {:error, _} = GithubApi.get_starred_repositories("error")
    end
  end
end
