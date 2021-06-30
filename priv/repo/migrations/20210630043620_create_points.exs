defmodule GoogleMap.Repo.Migrations.CreatePoints do
  use Ecto.Migration

  def change do
    create table(:points) do
      add :lat, :decimal
      add :lng, :decimal

      timestamps()
    end

  end
end
