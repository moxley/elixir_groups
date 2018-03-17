defmodule ElixirGroups.SignupTest do
  use ElixirGroups.DataCase

  alias ElixirGroups.Signup

  describe "users" do
    alias ElixirGroups.Signup.User

    @valid_attrs %{email: "some email", full_name: "some full_name", password: "my_password"}
    @update_attrs %{email: "some updated email", full_name: "some updated full_name"}
    @invalid_attrs %{email: nil, full_name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Signup.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Signup.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Signup.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Signup.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.full_name == "some full_name"
      assert user.password_hash == nil
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Signup.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Signup.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.full_name == "some updated full_name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Signup.update_user(user, @invalid_attrs)
      assert user == Signup.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Signup.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Signup.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Signup.change_user(user)
    end
  end
end
