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

    get "/signup", SignupController, :new
    post "/signup", SignupController, :create

    get "/login", SessionsController, :new
    post "/login", SessionsController, :create
    get "/logout", SessionsController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirGroupsWeb do
  #   pipe_through :api
  # end
end
