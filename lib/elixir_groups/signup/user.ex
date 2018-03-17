defmodule ElixirGroups.Signup.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirGroups.Signup.User

  schema "users" do
    field :email, :string
    field :full_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:full_name, :email])
    |> unique_constraint(:email)
    |> validate_required([:full_name, :email])
  end

  @doc false
  def changeset_for_signup(%User{} = user, attrs) do
    changeset =
      user
      |> cast(attrs, [:full_name, :email, :password])

    password = get_field(changeset, :password)
    hashed_password = Bcrypt.Base.hash_password(password || "", Bcrypt.gen_salt(12, true))

    changeset
    |> put_change(:password_hash, hashed_password)
    |> unique_constraint(:email)
    |> validate_required([:full_name, :email])
  end
end
