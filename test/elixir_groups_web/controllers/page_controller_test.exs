defmodule ElixirGroupsWeb.PageControllerTest do
  use ElixirGroupsWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to PDX Elixir"
  end
end
