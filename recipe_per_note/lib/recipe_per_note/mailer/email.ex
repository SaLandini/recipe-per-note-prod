defmodule RecipePerNote.Email do
  use Bamboo.Phoenix, view: RecipePerNote.EmailView

  def welcome_text_email(email_address) do
    new_email
    |> to(email_address)
    |> from("recipe.per.note@gmail.com")
    |> subject("SE RECEPER ISSO É POR QUE DEU CERTO")
    |> text_body("AMÉM")
  end

  def user_notifier_html_email(email_address, subject, html_body) do
    new_email
    |> to(email_address)
    |> from("recipe.per.note@gmail.com")
    |> subject(subject)
    |> html_body(html_body)
  end
end
