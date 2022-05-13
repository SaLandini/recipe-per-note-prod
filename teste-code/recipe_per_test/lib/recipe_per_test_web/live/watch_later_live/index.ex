defmodule RecipePerTestWeb.WatchLaterLive.Index do
  use RecipePerTestWeb, :live_view

  alias RecipePerTest.Notes
  alias RecipePerTest.Notes.WatchLater
  alias RecipePerTestWeb.Roles

  @impl true
  def mount(_params, session, socket) do
    socket = assign_defaults(session, socket)
    {:ok, assign(socket, :watchlaters, list_watchlaters())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    current_user = socket.assigns.current_user
    live_action = socket.assigns.live_action
    watch_later = watch_later_from_params(params)

    if Roles.can?(current_user, watch_later, live_action) do
      {:noreply, apply_action(socket, live_action, params)}
    else
      {:noreply,
       socket
       |> put_flash(:error, "Unauthorised")
       |> redirect(to: "/")}
    end
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Watch later")
    |> assign(:watch_later, Notes.get_watch_later!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Watch later")
    |> assign(:watch_later, %WatchLater{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Watchlaters")
    |> assign(:watch_later, nil)
  end

  defp watch_later_from_params(params)

  defp watch_later_from_params(%{"id" => id}),
    do: Notes.get_watch_later!(id)

  defp watch_later_from_params(_params), do: %WatchLater{}

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    current_user = socket.assigns.current_user
    watch_later = Notes.get_watch_later!(id)

    if RecipePerTestWeb.Roles.can?(current_user, watch_later, :delete) do
      watch_later = Notes.get_watch_later!(id)
      {:ok, _} = Notes.delete_watch_later(watch_later)
      {:noreply, assign(socket, :watchlaters, list_watchlaters())}
    else
      {:noreply,
       socket
       |> put_flash(:error, "Unauthorised")
       |> redirect(to: "/")}
    end
  end

  defp list_watchlaters do
    Notes.list_watchlaters()
  end
end
