[
  inputs: ["{mix,.formatter}.exs", "{config,lib,rel,test}/**/*.{ex,exs}"],
  locals_without_parens: [
    # Ecto
    from: 2,
    field: 2,
    field: 3,
    many_to_many: 2,
    many_to_many: 3,
    # EctoEnum
    defenum: 3,
    # Plug
    plug: 1,
    plug: 2,
    forward: 3,
    # Phoenix
    transport: 2,
    action_fallback: 1,
    socket: 2,
    render: 2,
    pipe_through: 1,
    head: 3,
    get: 3,
    post: 3,
    resources: 3,
    # Distillery
    set: 1,
    # JaSerializer
    attributes: 1,
    has_many: 2
  ]
]
