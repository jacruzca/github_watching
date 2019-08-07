defmodule GithubWatching.Domain.User do
  @moduledoc """
  Struct representation of a github user
  """
  alias __MODULE__
  alias GithubWatching.Domain.WatchingObject

  @type t :: %User{
          name: String.t(),
          login: String.t(),
          avatarUrl: String.t(),
          bioHTML: String.t(),
          company: String.t(),
          followers: WatchingObject.t(),
          gists: WatchingObject.t(),
          watching: WatchingObject.t(),
          starredRepositories: WatchingObject.t()
        }

  defstruct name: nil,
            login: nil,
            avatarUrl: nil,
            bioHTML: nil,
            company: nil,
            followers: nil,
            gists: nil,
            watching: [],
            starredRepositories: []
end
