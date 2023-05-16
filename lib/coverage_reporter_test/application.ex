defmodule CoverageReporterTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CoverageReporterTestWeb.Telemetry,
      # Start the Ecto repository
      CoverageReporterTest.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: CoverageReporterTest.PubSub},
      # Start Finch
      {Finch, name: CoverageReporterTest.Finch},
      # Start the Endpoint (http/https)
      CoverageReporterTestWeb.Endpoint
      # Start a worker by calling: CoverageReporterTest.Worker.start_link(arg)
      # {CoverageReporterTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CoverageReporterTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CoverageReporterTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
