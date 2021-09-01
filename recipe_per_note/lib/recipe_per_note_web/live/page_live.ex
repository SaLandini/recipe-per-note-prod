defmodule RecipePerNoteWeb.PageLive do
  use RecipePerNoteWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign( socket, query: "", results: %{})}
  end
end
