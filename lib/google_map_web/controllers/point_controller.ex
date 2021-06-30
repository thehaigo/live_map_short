defmodule GoogleMapWeb.PointController do
  use GoogleMapWeb, :controller

  alias GoogleMap.Loggers
  alias GoogleMap.Loggers.Point

  def create(conn, point_params) do
    with {:ok, %Point{}} <- Loggers.create_point(point_params) do
      send_resp(conn, 200, "ok")
    end
  end
end
