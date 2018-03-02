defmodule ElixirGroups.RegisterUser do
  import Comeonin.Bcrypt
  alias ElixirGroups.User
  alias ElixirGroups.Repo

  def execute(full_name, email, password) do
    user = %User{
      full_name: full_name,
      email: email,
      password_hash: hashpwsalt(password)
    } |> Repo.insert

    { :ok, user }
  end

end