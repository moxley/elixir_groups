defmodule ElixirGroupsWeb.SessionsController do
  use ElixirGroupsWeb.Web, :controller

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{ "sign_in" => %{ "email" => email, "password" => password } }) do
    result = ElixirGroupsWeb.AuthenticateUser.execute(email, password)

    case result do
      { :ok, user } ->
        conn
        |> put_session(:current_user, user)
        |> redirect(to: "/")
      { :error, message } ->
        conn
        |> put_flash(:error, message)
        |> render "new.html"
    end
  end

  def destroy(conn, _params) do
    conn
    |> put_session(:current_user, nil)
    |> redirect(to: "/sign_in")
  end

end