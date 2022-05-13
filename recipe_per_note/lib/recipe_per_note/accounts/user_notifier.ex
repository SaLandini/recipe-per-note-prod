defmodule RecipePerNote.Accounts.UserNotifier do
  alias RecipePerNote.Email
  # For simplicity, this module simply logs messages to the terminal.
  # You should replace it by a proper email or notification tool, such as:
  #
  #   * Swoosh - https://hexdocs.pm/swoosh
  #   * Bamboo - https://hexdocs.pm/bamboo
  #
  defp deliver(to, subject, html_body) do
    Email.user_notifier_html_email(to, subject, html_body)
  end

  @doc """
  Deliver instructions to confirm account.
  """
  def deliver_confirmation_instructions(user, subject, url) do
    deliver(
      user.email,
      subject,
      """
          ==============================
          <br>
          <br>
          Hi #{user.email}
          <br>
          You can confirm your account by visiting the URL below:
          <br>
          #{url}
          <br>
          If you didn't create an account with us, please ignore this.
          <br>
          <br>
          ==============================
      """
    )
  end

  @doc """
  Deliver instructions to reset a user password.
  """
  def deliver_reset_password_instructions(user, subject, url) do
    deliver(
      user.email,
      subject,
      """
          ==============================
          <br>
          <br>
          Hi #{user.email}
          <br>
          You can reset your password by visiting the URL below:
          <br>
          #{url}
          <br>
          If you didn't request this change, please ignore this.
          <br>
          <br>
          ==============================
      """
    )
  end

  @doc """
  Deliver instructions to update a user email.
  """
  def deliver_update_email_instructions(user, subject, url) do
    deliver(
      user.email,
      subject,
      """
          ==============================
          <br>
          <br>
          Hi #{user.email}
          <br>
          You can change your email by visiting the URL below:
          <br>
          #{url}
          <br>
          If you didn't request this change, please ignore this.
          <br>
          <br>
          ==============================
      """
    )
  end

  def deliver_todo_notify(user, subject, todos) do
    deliver(
      user.email,
      subject,
      """
        ================================
        <br><br>
        Hi #{user.name}
        <hr>
        You have this ToDos for today:
        #{todos.titles}:
        <br><br>
        #{todos.descri}
      """
    )
  end
end
