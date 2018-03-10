defmodule ElixirGroupsWeb.Router do
  use ElixirGroupsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :require_user do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug ElixirGroupsWeb.Plugs.RequireAuthentication
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirGroupsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/code-of-conduct", PageController, :code_of_conduct

    get "/signup", SignupController, :new
    post "/signup", SignupController, :create
  end

  # for Auth
  scope "/auth", ElixirGroupsWeb do
    # could also pipe threw require_user for some routes
    pipe_through :browser

    get "/sign_in", SessionsController, :new
    post "/sign_in", SessionsController, :create
    get "/signout", SessionsController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirGroupsWeb do
  #   pipe_through :api
  # end
end
