defmodule RecipePerNoteWeb.NotesLive.Index do
  use RecipePerNoteWeb, :live_view

  alias RecipePerNote.Annotations
  alias RecipePerNote.Annotations.Notes

  @impl true
  def mount(_params, session, socket) do
    socket =
      assign_defaults(session, socket)

    notes =
      socket
      |> list_notes
      |> is_notes_nil?

    {:ok, assign(socket, :notes, notes)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Notes")
    |> assign(:note, Annotations.get_notes!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Notes")
    |> assign(:note, %Notes{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing notes")
    |> assign(:note, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    notes = Annotations.get_notes!(id)
    {:ok, _} = Annotations.delete_notes(notes)

    {:noreply, assign(socket, :notes, list_notes(socket))}
  end

  defp is_notes_nil?(notes) do
    if notes == [] do
      :nada
    else
      notes
    end
  end

  defp list_notes(socket) do
    Annotations.list_notes(socket.assigns[:current_user])
  end
end
