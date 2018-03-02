defmodule ElixirGroups.Signup.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirGroups.Signup.User


  schema "users" do
    field :email, :string
    field :full_name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:full_name, :email])
    |> unique_constraint(:email)
    |> validate_required([:full_name, :email])
  end
end
