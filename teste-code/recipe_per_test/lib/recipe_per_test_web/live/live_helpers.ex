defmodule RecipePerTestWeb.LiveHelpers do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers
  alias RecipePerTest.Accounts
  alias RecipePerTest.Accounts.User
  alias RecipePerTestWeb.Router.Helpers, as: Routes
  @doc """
  Renders a component inside the `RecipePerTestWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, RecipePerTestWeb.WatchLaterLive.FormComponent,
        id: @watch_later.id || :new,
        action: @live_action,
        watch_later: @watch_later,
        return_to: Routes.watch_later_index_path(@socket, :index) %>
  """
  def assign_defaults(session, socket) do
    socket = assign_new(socket, :current_user, fn ->
      find_current_user(session)
     end)

     case socket.assigns.current_user do
      %User{} ->
        socket

      _other ->
        socket
        |> put_flash(:error, "You must be logged to access this page")
        |> redirect(to: Routes.user_session_path(socket, :new))
     end
  end

  defp find_current_user(session) do
    with user_token when not is_nil(user_token) <- session["user_token"],
      %User{} = user <- Accounts.get_user_by_session_token(user_token), do: user
  end

  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, RecipePerTestWeb.ModalComponent, modal_opts)
  end
end
