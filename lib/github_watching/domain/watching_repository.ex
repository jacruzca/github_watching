defmodule GithubWatching.Domain.WatchingRepository do
  @moduledoc """
  Struct representation for a watching repository (edge)
  """
  alias __MODULE__
  alias GithubWatching.Domain.Repository

  @type t :: %WatchingRepository{
          cursor: String.t(),
          node: Repository.t()
        }

  defstruct cursor: nil,
            node: nil
end
