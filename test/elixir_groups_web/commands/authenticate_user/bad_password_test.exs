# defmodule ElixirGroupsWeb.AuthenticateUser.BadPasswordTest do
#   use ElixirGroups.ModelCase
#   alias ElixirGroupsWeb.RegisterUser
#   alias ElixirGroupsWeb.AuthenticateUser

#   test "return error" do
#     { :ok, user } = RegisterUser.execute("Talon Karrde", "talon@karrde.com", "m@k3m0n3y")

#     result = AuthenticateUser.execute("talon@karrde.com", "admiralthrawnsucks")

#     assert result == { :error, "Incorrect email and/or password" }
#   end

# end
