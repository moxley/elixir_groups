require IEx

defmodule ElixirGroups.RegisterUser.OkTest do

  use ElixirGroups.ModelCase
  alias ElixirGroupsWeb.SignUp.User
  alias ElixirGroupsWeb.RegisterUser

  test "user is created and password hashed" do
    # IEx.pry
    result = RegisterUser.execute("Talon Karrde", "talon@karrde.com", "m@k3m0n3y")

    { :ok, user } = result
{:ok, user} = Signup.create_user(@create_attrs)
    user
    assert user.id != nil
    assert user.full_name == "Talon Karrde"
    assert user.email == "talon@karrde.com"
    assert user.password_hash != nil
    assert user.password_hash != "m@k3m0n3y"

    assert Enum.count(User |> Repo.all) == 1
  end

end