defmodule GithubWatching.Domain.User do
  @moduledoc """
  Struct representation of a github user
  """
  alias __MODULE__
  alias GithubWatching.Domain.WatchingObject

  @type t :: %User{
          name: String.t(),
          login: String.t(),
          watching: WatchingObject.t()
        }

  defstruct name: nil,
            login: nil,
            watching: []
end
