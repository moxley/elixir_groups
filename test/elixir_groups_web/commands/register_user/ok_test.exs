require IEx

defmodule ElixirGroups.RegisterUser.OkTest do
  use ElixirGroups.ModelCase
  alias ElixirGroups.Repo
  alias ElixirGroups.Signup.User
  alias ElixirGroupsWeb.RegisterUser

  test "user is created and password hashed" do
    result = RegisterUser.execute("Talon Karrde", "talon@karrde.com", "m@k3m0n3y")

    assert {:ok, user} = result

    assert user.id != nil
    assert user.full_name == "Talon Karrde"
    assert user.email == "talon@karrde.com"
    assert user.password_hash != nil
    assert user.password_hash != "m@k3m0n3y"

    assert Repo.aggregate(User, :count, :id) == 1
  end
end
