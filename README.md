# elixir_groups
Manage groups, events and RSVPs

## Get it running!

1. `mix deps.get`
1. `docker run --name phoenix-postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -d -p 5432:5432 postgres`
1. `mix ecto.create`
1. `mix ecto.migrate`
1. `mix phx.server`