defmodule GithubWatching.WatchingParams do
  @moduledoc """
  Struct representation for watching params
  """

  alias __MODULE__

  @default_first 10

  @type t :: %WatchingParams{
          first: Integer.t(),
          after_cursor: String.t(),
          before_cursor: String.t(),
          order_by: String.t()
        }

  defstruct first: @default_first,
            after_cursor: nil,
            before_cursor: nil,
            order_by: "{field: CREATED_AT, direction: ASC}"

  @spec build_watching_params(GithubWatching.WatchingParams.t()) :: String.t()
  def build_watching_params(%WatchingParams{
        first: first,
        after_cursor: nil,
        before_cursor: nil,
        order_by: order_by
      }) do
    "first: #{first}, orderBy: #{order_by}"
  end

  def build_watching_params(%WatchingParams{
        first: first,
        after_cursor: after_cursor,
        before_cursor: nil,
        order_by: order_by
      }) do
    "first: #{first}, after: #{after_cursor}, orderBy: #{order_by}"
  end

  def build_watching_params(%WatchingParams{
        first: first,
        before_cursor: before_cursor,
        after_cursor: nil,
        order_by: order_by
      }) do
    "last: #{first}, before: #{before_cursor}, orderBy: #{order_by}"
  end
end
