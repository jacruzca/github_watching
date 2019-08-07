defmodule GithubWatchingWeb.Router do
  use GithubWatchingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GithubWatchingWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/watching", GithubWatchingWeb.Controllers.Watching do
    pipe_through :browser

    get "/", WatchingController, :index
    post "/", WatchingController, :search
  end

  scope "/starred", GithubWatchingWeb.Controllers.Starred do
    pipe_through :browser

    get "/", StarredController, :index
    post "/", StarredController, :search
  end

  # Other scopes may use custom stacks.
  # scope "/api", GithubWatchingWeb do
  #   pipe_through :api
  # end
end
