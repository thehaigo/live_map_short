defmodule GoogleMap.Loggers.Point do
  use Ecto.Schema
  import Ecto.Changeset

  schema "points" do
    field :lat, :decimal
    field :lng, :decimal

    timestamps()
  end

  @doc false
  def changeset(point, attrs) do
    point
    |> cast(attrs, [:lat, :lng])
    |> validate_required([:lat, :lng])
  end
end
