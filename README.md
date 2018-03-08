# elixir_groups

Platform that supports members, events and RSVPs

## Developer Setup

### Install Elixir

Follow this guide: https://elixir-lang.org/install.html

### Install Postgres

Either install PostgreSQL with a package manager directly to your OS, or install
with Docker. It is recommended that you install directly to your OS if you don't
currently use Docker.

If using MacOS:

Install PostgreSQL with `brew` (must have Homebrew installed):

https://gist.github.com/sgnl/609557ebacd3378f3b72

If using Docker:
`docker run --name phoenix-postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -d -p 5432:5432 postgres`

### Install npm

https://www.npmjs.com/get-npm

## Get it running!

1. `git clone https://github.com/moxley/elixir_groups.git`
  - Or if you are a write contributor: `git clone git@github.com:moxley/elixir_groups.git`
1. `cd elixir_groups`
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

Visit `http://localhost:4000`

## Run Tests

```
mix test
```
