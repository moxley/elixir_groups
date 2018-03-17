defmodule ElixirGroupsWeb.Plugs.RequireAuthentication do
  import Plug.Conn
  import Phoenix.Controller

  def init(options) do
    options
  end

  def call(conn, _) do
    user = get_session(conn, :current_user)

    case user do
      nil ->
        conn |> redirect(to: "/sign_in") |> halt

      _ ->
        conn |> assign(:current_user, user)
    end
  end
end
