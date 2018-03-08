defmodule ElixirGroupsWeb.SignupController do
  use ElixirGroupsWeb, :controller

  alias ElixirGroups.{Signup, Signup.User}

  def new(conn, _params) do
    changeset = Signup.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Signup.create_user(user_params) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "Account created successfully.")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
