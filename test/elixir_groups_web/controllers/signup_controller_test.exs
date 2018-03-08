defmodule ElixirGroupsWeb.SignupControllerTest do
  use ElixirGroupsWeb.ConnCase

  alias ElixirGroups.Signup

  @create_attrs %{email: "talon@karrde.com", full_name: "Talon Karrde", password_hash: "m@k3m0n3y" }
  @invalid_attrs %{@create_attrs | email: ""}

  def fixture(:user) do
    {:ok, user} = Signup.create_user(@create_attrs)
    user
  end

  describe "new signup" do
    test "renders form", %{conn: conn} do
      conn = get conn, signup_path(conn, :new)
      assert html_response(conn, 200) =~ "Signup"
    end
  end

  describe "signup user" do
    test "redirects to home page when data is valid", %{conn: conn} do
      conn = post conn, signup_path(conn, :create), user: @create_attrs
      assert redirected_to(conn) == "/"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, signup_path(conn, :create), user: @invalid_attrs
      assert html_response(conn, 200) =~ "Signup"
    end
  end
end
