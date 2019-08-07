defmodule GithubWatching.Domain.PageInfo do
  alias __MODULE__

  @type t :: %PageInfo{
          endCursor: String.t(),
          startCursor: String.t(),
          hasNextPage: boolean(),
          hasPreviousPage: boolean()
        }

  defstruct endCursor: nil,
            startCursor: nil,
            hasNextPage: nil,
            hasPreviousPage: nil
end
