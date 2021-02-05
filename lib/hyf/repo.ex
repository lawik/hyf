defmodule Hyf.Repo do
  use Ecto.Repo,
    otp_app: :hyf,
    adapter: Ecto.Adapters.Postgres
end
