# elixir_groups

Manage groups, events and RSVPs

## Developer Setup

### Install Elixir

### Install Postgres

`docker run --name phoenix-postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -d -p 5432:5432 postgres`

## Get it running!

1. `git clone [repo]`
1. `cd [repo]`
1. `mix deps.get`
  - Enter 'Y' to any prompts
1. `mix ecto.create`
1. `mix ecto.migrate`
1. `mix phx.server`
