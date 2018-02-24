# elixir_groups

Manage groups, events and RSVPs

## Developer Setup

### Install Elixir

TBD

### Install Postgres

If using Docker:
`docker run --name phoenix-postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -d -p 5432:5432 postgres`

If using MacOS

Install PostgreSQL with brew:

https://gist.github.com/sgnl/609557ebacd3378f3b72

### Install npm

TBD

## Get it running!

1. `git clone [repo]`
1. `cd [repo]`
1. `mix deps.get`
  - Enter 'Y' to any prompts
1. `mix ecto.create`
1. `mix ecto.migrate`
1. Install assets:
  ```
  cd assets
  npm install
  cd ..
  ```
1. `mix phx.server`
