defmodule RecipePerNoteWeb.ToDoLive.Index do
  use RecipePerNoteWeb, :live_view

  alias RecipePerNote.ComparesTime.Time
  alias RecipePerNote.Annotations
  alias RecipePerNote.Annotations.ToDo

  @impl true
  def mount(_params, session, socket) do
    socket =
      assign_defaults(session, socket)

    todos =
      socket
      |> list_todos
      |> is_todos_nil?

    IO.inspect(todos)
    {:ok, assign(socket, :todos, todos)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit To do")
    |> assign(:to_do, Annotations.get_to_do!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New To do")
    |> assign(:to_do, %ToDo{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Todos")
    |> assign(:to_do, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    to_do = Annotations.get_to_do!(id)
    {:ok, _} = Annotations.delete_to_do(to_do)

    {:noreply, assign(socket, :todos, list_todos(socket))}
  end

  defp is_todos_nil?(todos) do
    if todos == [] do
      :nada
    else
      todos
    end
  end

  defp list_todos(socket) do
    Annotations.list_todos(socket.assigns[:current_user])
  end
end
