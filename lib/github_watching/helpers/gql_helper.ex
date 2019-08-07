defmodule GithubWatching.Helpers.GqlHelper do
  @moduledoc """
  GraphQL helper
  """
  @behaviour GithubWatching.Helpers.GqlHelperBehaviour

  alias GithubWatching.Helpers.MapHelper

  defp api_key, do: Application.get_env(:github_watching, :api_key)
  defp endpoint, do: Application.get_env(:github_watching, :endpoint)

  defp init() do
    Neuron.Config.set(url: endpoint())

    Neuron.Config.set(
      headers: [
        Authorization: "Bearer #{api_key()}"
      ]
    )
  end

  def query(body) do
    init()

    case body |> Neuron.query() do
      {:ok, response} ->
        response |> Map.get(:body) |> MapHelper.atomize_keys() |> decode()

      error ->
        error
    end
  end

  defp decode(%{data: data}) do
    {:ok, data}
  end

  defp decode(%{errors: errors}) do
    {:error, errors}
  end
end
