defmodule ElixirGroupsWeb.PageController do
  use ElixirGroupsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def code_of_conduct(conn, _params) do
    render conn, "code-of-conduct.html"
  end
end
