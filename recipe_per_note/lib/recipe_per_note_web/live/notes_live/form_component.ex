defmodule RecipePerNoteWeb.NotesLive.FormComponent do
  use RecipePerNoteWeb, :live_component

  alias RecipePerNote.Annotations

  @impl true
  def update(%{notes: notes} = assigns, socket) do
    changeset = Annotations.change_notes(notes)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"notes" => notes_params}, socket) do
    changeset =
      socket.assigns.notes
      |> Annotations.change_notes(notes_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"notes" => notes_params}, socket) do
    save_notes(socket, socket.assigns.action, notes_params)
  end

  defp save_notes(socket, :edit, notes_params) do
    case Annotations.update_notes(socket.assigns.notes, notes_params) do
      {:ok, _notes} ->
        {:noreply,
         socket
         |> put_flash(:info, "Watch later updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_notes(socket, :new, notes_params) do
    case Annotations.create_notes(notes_params) do
      {:ok, _notes} ->
        {:noreply,
         socket
         |> put_flash(:info, "Watch later created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
