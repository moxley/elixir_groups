defmodule ElixirGroupsWeb.RegisterUser do
  import Comeonin.Bcrypt
  alias ElixirGroups.Signup.User
  alias ElixirGroups.Repo

  def execute(full_name, email, password) do
    params = %{
      full_name: full_name,
      email: email
    }

    %User{password_hash: hashpwsalt(password)}
    |> User.changeset(params)
    |> Repo.insert()
  end
end
