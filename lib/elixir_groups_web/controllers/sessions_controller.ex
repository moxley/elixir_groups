defmodule ElixirGroupsWeb.SessionsController do
  use ElixirGroupsWeb, :controller

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{ "login" => %{ "email" => email, "password" => password } }) do
    result = ElixirGroupsWeb.AuthenticateUser.execute(email, password)

    case result do
      { :ok, user } ->
        conn
        |> put_session(:current_user, user)
        |> redirect(to: "/")
      { :error, message } ->
        conn
        |> put_flash(:error, message)
        |> render("new.html")
    end
  end

  def destroy(conn, _params) do
    conn
    |> put_session(:current_user, nil)
    |> redirect(to: "/login")
  end

end