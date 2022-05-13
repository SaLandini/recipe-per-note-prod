defmodule RecipePerTestWeb.WatchLaterLive.FormComponent do
  use RecipePerTestWeb, :live_component

  alias RecipePerTest.Notes

  @impl true
  def update(%{watch_later: watch_later} = assigns, socket) do
    changeset = Notes.change_watch_later(watch_later)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"watch_later" => watch_later_params}, socket) do
    changeset =
      socket.assigns.watch_later
      |> Notes.change_watch_later(watch_later_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"watch_later" => watch_later_params}, socket) do
    save_watch_later(socket, socket.assigns.action, watch_later_params)
  end

  defp save_watch_later(socket, :edit, watch_later_params) do
    case Notes.update_watch_later(socket.assigns.watch_later, watch_later_params) do
      {:ok, _watch_later} ->
        {:noreply,
         socket
         |> put_flash(:info, "Watch later updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_watch_later(socket, :new, watch_later_params) do
    current_user = socket.assigns.current_user
    watch_later_params = Map.put(watch_later_params, "user_id", current_user.id)

    case Notes.create_watch_later(watch_later_params) do
      {:ok, _watch_later} ->
        {:noreply,
         socket
         |> put_flash(:info, "Watch later created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
