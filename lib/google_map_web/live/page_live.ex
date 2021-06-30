defmodule GoogleMapWeb.PageLive do
  use GoogleMapWeb, :live_view
  alias GoogleMap.Loggers

  @impl true
  def mount(_params, _session, socket) do
    Loggers.subscribe(:map)
    points = Loggers.list_points |> Enum.map(fn p -> %{lat: p.lat, lng: p.lng} end)
    {
      :ok,
      socket
      |> push_event("init_map", %{points: points})
    }
  end

  @impl true
  def handle_info({:created_point, point}, socket) do
    {
      :noreply,
      socket
      |> push_event("created_point", %{ point: %{ lat: point.lat, lng: point.lng} })
    }
  end
end
