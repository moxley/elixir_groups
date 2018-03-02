defmodule ElixirGroups.AuthenticateUser.NoUserTest do
  use ElixirGroups.ModelCase
  alias ElixirGroups.AuthenticateUser

  test "return error" do
    result = AuthenticateUser.execute("mara@jade.com", "lukeistheworst")

    assert result == { :error, "Incorrect email and/or password" }
  end

end