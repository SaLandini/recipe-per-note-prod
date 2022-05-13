defmodule RecipePerNoteWeb.ToDoLive.FormComponent do
  use RecipePerNoteWeb, :live_component

  alias RecipePerNote.Annotations

  @impl true
  def update(%{to_do: to_do} = assigns, socket) do
    changeset = Annotations.change_to_do(to_do)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"to_do" => to_do_params}, socket) do
    changeset =
      socket.assigns.to_do
      |> Annotations.change_to_do(to_do_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"to_do" => to_do_params}, socket) do
    save_to_do(socket, socket.assigns.action, to_do_params)
  end

  defp save_to_do(socket, :edit, to_do_params) do
    case Annotations.update_to_do(socket.assigns.to_do, to_do_params) do
      {:ok, _to_do} ->
        {:noreply,
         socket
         |> put_flash(:info, "To do updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_to_do(socket, :new, to_do_params) do
    case Annotations.create_to_do(to_do_params) do
      {:ok, _to_do} ->
        {:noreply,
         socket
         |> put_flash(:info, "To do created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
