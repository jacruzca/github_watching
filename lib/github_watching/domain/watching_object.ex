defmodule GithubWatching.Domain.WatchingObject do
  @moduledoc """
  Struct representation for a watching object
  """
  alias __MODULE__
  alias GithubWatching.Domain.WatchingRepository
  alias GithubWatching.Domain.PageInfo

  @type t :: %WatchingObject{
          edges: [WatchingRepository.t()],
          pageInfo: PageInfo.t(),
          totalCount: Integer.t()
        }

  defstruct edges: [],
            pageInfo: nil,
            totalCount: 0
end
