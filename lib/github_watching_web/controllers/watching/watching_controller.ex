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
    debug("search with params #{inspect(params)}")
    assigns = @default_assigns

    IO.inspect("Olv values:")
    IO.inspect(conn)

    assigns =
      case GithubApi.get_watching_repositories(username, %WatchingParams{after_cursor: cursor}) do
        {:ok, user} -> %{assigns | user: user}
        {:error, error} -> %{assigns | error: error}
      end

    %{conn | assigns: Map.merge(conn.assigns, assigns)}
    |> put_view(WatchingView)
    |> render("watching_index.html")
  end

  def search(conn, %{"username" => username} = params) do
    debug("search with params #{inspect(params)}")
    assigns = @default_assigns

    assigns =
      case GithubApi.get_watching_repositories(username) do
        {:ok, user} -> %{assigns | user: user}
        {:error, error} -> %{assigns | error: error}
      end

    %{conn | assigns: Map.merge(conn.assigns, assigns)}
    |> put_view(WatchingView)
    |> render("watching_index.html")
  end
end
