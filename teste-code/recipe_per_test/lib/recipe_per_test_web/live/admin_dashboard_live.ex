defmodule RecipePerTestWeb.AdminDashboardLive do
  use RecipePerTestWeb, :live_view

  @impl true
  def mount(_params, session, socket) do
    {:ok, assign(socket, session)}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <section class="phx-hero">
      <h1>Welcome to the admin dashboard!</h1>
    </section>
    """
  end
end
