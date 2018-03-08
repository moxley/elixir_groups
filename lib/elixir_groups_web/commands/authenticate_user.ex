defmodule ElixirGroupsWeb.AuthenticateUser do
  import Comeonin.Bcrypt
  import Ecto.Query
  alias ElixirGroupsWeb.Signup.User
  alias ElixirGroups.Repo

  def execute(email, password) do
    user = User
      |> where([u], u.email == ^email)
      |> Repo.one

    validate_password(user, password)
  end

  # if we don't find a user
  def validate_password(nil, _), do: invalidate_credentials()

  # if the password is blank
  def validate_password(_, nil), do: invalidate_credentials()

  # check password against password hash
  def validate_password(user, password) do
    result = checkpw(password, user.password_hash)
    case result do
      false -> invalidate_credentials()
      true -> { :ok, user }
    end
  end

  def invalidate_credentials, do:
    { :error, "Incorrect email and/or password" }

end