defmodule GithubWatching.Helpers.GqlHelperBehaviour do
  @moduledoc false

  @callback query(String.t()) :: {:ok, map()} | {:error, map()}
end
