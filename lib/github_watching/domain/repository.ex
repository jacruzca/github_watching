defmodule GithubWatching.Domain.Repository do
  @moduledoc """
  Struct representation for a repository
  """
  alias __MODULE__

  @type t :: %Repository{
          name: String.t(),
          url: String.t(),
          createdAt: DateTime.t()
        }

  defstruct name: nil,
            url: nil,
            createdAt: nil
end
