defmodule GithubWatchingWeb.PageController do
  use GithubWatchingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
