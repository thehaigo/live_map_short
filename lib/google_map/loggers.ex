defmodule GoogleMap.Loggers do
  import Ecto.Query, warn: false
  alias GoogleMap.Repo

  alias GoogleMap.Loggers.Point

  def list_points do
      Repo.all(Point)
  end

  def create_point(attrs \\ %{}) do
    %Point{}
    |> Point.changeset(attrs)
    |> Repo.insert()
    |> broadcast(:created_point)
  end

  def subscribe(:map) do
    Phoenix.PubSub.subscribe(GoogleMap.PubSub, "map")
  end

  def broadcast({:ok, point}, :created_point = event) do
    Phoenix.PubSub.broadcast(GoogleMap.PubSub, "map", {event, point})
    {:ok, point}
  end
end
