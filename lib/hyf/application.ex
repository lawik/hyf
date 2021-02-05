defmodule Hyf.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      # Hyf.Repo,
      # Start the Telemetry supervisor
      HyfWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hyf.PubSub},
      # Start the Endpoint (http/https)
      HyfWeb.Endpoint
      # Start a worker by calling: Hyf.Worker.start_link(arg)
      # {Hyf.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hyf.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HyfWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
