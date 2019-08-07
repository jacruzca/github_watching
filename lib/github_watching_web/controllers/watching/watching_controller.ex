defmodule GithubWatchingWeb.Controllers.Watching.WatchingController do
  use GithubWatchingWeb, :controller

  import Logger
  alias GithubWatchingWeb.Views.Watching.WatchingView
  alias GithubWatching.WatchingParams
  alias GithubWatching.GithubApi

  @default_assigns %{user: nil, error: nil}

  def index(conn, _params) do
    assigns = @default_assigns

    %{conn | assigns: Map.merge(conn.assigns, assigns)}
    |> put_view(WatchingView)
    |> render("watching_index.html")
  end

  def search(conn, %{"username" => username, "cursor" => cursor} = params) do
    conn |> do_search(username, %WatchingParams{after_cursor: cursor})
  end

  def search(conn, %{"username" => username, "before_cursor" => cursor}) do
    conn |> do_search(username, %WatchingParams{before_cursor: cursor})
  end

  def search(conn, %{"username" => username}) do
    conn |> do_search(username)
  end

  defp do_search(conn, username, params \\ %WatchingParams{}) do
    debug("search with params #{inspect(params)}")
    assigns = @default_assigns

    assigns =
      case GithubApi.get_watching_repositories(username, params) do
        {:ok, user} -> %{assigns | user: user}
        {:error, error} -> %{assigns | error: error}
      end

    %{conn | assigns: Map.merge(conn.assigns, assigns)}
    |> put_view(WatchingView)
    |> render("watching_index.html")
  end
end
