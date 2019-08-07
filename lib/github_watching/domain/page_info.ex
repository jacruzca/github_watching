defmodule GithubWatching.Domain.PageInfo do
  alias __MODULE__

  @type t :: %PageInfo{
          endCursor: String.t(),
          hasNextPage: boolean()
        }

  defstruct endCursor: nil,
            hasNextPage: nil
end
