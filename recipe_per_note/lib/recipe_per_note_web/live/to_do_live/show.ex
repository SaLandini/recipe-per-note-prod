defmodule RecipePerNoteWeb.ToDoLive.Show do
  use RecipePerNoteWeb, :live_view

  alias RecipePerNote.Annotations

  @impl true
  def mount(_params, session, socket) do
    socket = assign_defaults(session, socket)
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:to_do, Annotations.get_to_do!(id))}
  end

  defp page_title(:show), do: "Show To do"
  defp page_title(:edit), do: "Edit To do"
end
