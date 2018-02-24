defmodule ElixirGroupsWeb.PageController do
  use ElixirGroupsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
