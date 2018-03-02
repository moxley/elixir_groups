defmodule ElixirGroups.AuthenticateUser.OkTest do
  use ElixirGroups.ModelCase
  alias ElixirGroups.RegisterUser
  alias ElixirGroups.AuthenticateUser

  test "return ok and user to sign in" do
    { :ok, user } = RegisterUser.execute("Talon Karrde", "talon@karrde.com", "m@k3m0n3y")

    result = AuthenticateUser.execute("talon@karrde.com", "m@k3m0n3y")

    assert result == { :ok, user }
  end

end