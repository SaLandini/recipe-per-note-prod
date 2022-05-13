defmodule RecipePerNote.ComparesTime.Time do
  require Math

  defp module_function(value) do
    value
    |> Math.pow(2)
    |> Math.sqrt
    |> round
  end

  def return_date do
    date_test = Date.utc_today()

    IO.puts(date_test)
  end

  def is_passed_the_limit_date_text?(limit, date) do
    diff = Date.diff(limit, date)

    case diff do
      diff when diff < 0 ->
        "Faz #{diff |> module_function} dias que passou"

      diff when diff == 0 ->
        "Acaba hoje o prazo"

      diff when diff > 0 ->
        "Falta #{diff} dias pra acabar o prazo"

      _ ->
          "Amém"
    end
  end

  def is_passed_the_limit_date_class?(limit, date) do
    diff = Date.diff(limit, date)

    case diff do
      diff when diff < 0 ->
        "box_late"

      diff when diff == 0 ->
        "box_now"

      diff when diff > 0 ->
        "box_havetime"

      _ ->
          "Amém"
    end
  end
end
