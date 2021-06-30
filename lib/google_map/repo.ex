defmodule GoogleMap.Repo do
  use Ecto.Repo,
    otp_app: :google_map,
    adapter: Ecto.Adapters.Postgres
end
