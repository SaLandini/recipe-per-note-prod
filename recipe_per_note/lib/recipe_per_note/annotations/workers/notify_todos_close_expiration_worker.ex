defmodule RecipePerNote.Annotations.NotifyTodosCloseExpirationWorker do
  use Oban.Worker, queue: :mailer
  alias RecipePerNote.Annotations
  alias RecipePerNote.Accounts.UserNotifier

  def perform do
    for todo <- Annotations.list_todos_from_date(Date.utc_today()) do
      UserNotifier.deliver_todo_notify(todo.user, "You have this ToDos: ", todo)
      |> RecipePerNote.Mailer.deliver_now()
    end

    :ok
  end
end
