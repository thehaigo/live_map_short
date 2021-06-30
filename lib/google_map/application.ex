defmodule GoogleMap.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GoogleMap.Repo,
      # Start the Telemetry supervisor
      GoogleMapWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GoogleMap.PubSub},
      # Start the Endpoint (http/https)
      GoogleMapWeb.Endpoint
      # Start a worker by calling: GoogleMap.Worker.start_link(arg)
      # {GoogleMap.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GoogleMap.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GoogleMapWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
