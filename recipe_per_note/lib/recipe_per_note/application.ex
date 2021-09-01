defmodule RecipePerNote.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RecipePerNote.Repo,
      # Start the Telemetry supervisor
      RecipePerNoteWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RecipePerNote.PubSub},
      # Start the Endpoint (http/https)
      RecipePerNoteWeb.Endpoint
      # Start a worker by calling: RecipePerNote.Worker.start_link(arg)
      # {RecipePerNote.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RecipePerNote.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RecipePerNoteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
