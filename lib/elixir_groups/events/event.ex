defmodule ElixirGroups.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirGroups.Events.Event


  schema "events" do
    field :description, :string
    field :details, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Event{} = event, attrs) do
    event
    |> cast(attrs, [:name, :description, :details])
    |> validate_required([:name, :description, :details])
  end
end
