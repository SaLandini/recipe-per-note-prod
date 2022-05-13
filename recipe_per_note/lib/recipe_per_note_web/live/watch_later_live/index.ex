defmodule RecipePerNoteWeb.WatchLaterLive.Index do
  use RecipePerNoteWeb, :live_view

  alias RecipePerNote.Annotations
  alias RecipePerNote.Annotations.WatchLater

  @impl true
  def mount(_params, session, socket) do
    socket =
      assign_defaults(session, socket)

   watchlater =
      socket
        |> list_watchlater
        |> is_watchlater_nil?

    {:ok, assign(socket, :watchlater, watchlater)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Watch later")
    |> assign(:watch_later, Annotations.get_watch_later!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Watch later")
    |> assign(:watch_later, %WatchLater{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Watchlater")
    |> assign(:watch_later, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    watch_later = Annotations.get_watch_later!(id)
    {:ok, _} = Annotations.delete_watch_later(watch_later)

    {:noreply, assign(socket, :watchlater, list_watchlater(socket))}
  end

  defp is_watchlater_nil?(watchlater) do
    if watchlater == [] do
      :nada
    else
      watchlater
    end
  end

  defp list_watchlater(socket) do
    Annotations.list_watchlater(socket.assigns[:current_user])
  end
end
