defmodule ElixirGroups.Repo do
  use Ecto.Repo, otp_app: :elixir_groups

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end

  def child_spec(_) do
    %{id: __MODULE__, start: {__MODULE__, :start_link, []}, type: :supervisor}
  end
end
