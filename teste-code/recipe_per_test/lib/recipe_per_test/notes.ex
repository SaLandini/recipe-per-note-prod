defmodule RecipePerTest.Notes do
  @moduledoc """
  The Notes context.
  """

  import Ecto.Query, warn: false
  alias RecipePerTest.Repo

  alias RecipePerTest.Notes.WatchLater

  @doc """
  Returns the list of watchlaters.

  ## Examples

      iex> list_watchlaters()
      [%WatchLater{}, ...]

  """
  def list_watchlaters do
    Repo.all(WatchLater)
  end

  @doc """
  Gets a single watch_later.

  Raises `Ecto.NoResultsError` if the Watch later does not exist.

  ## Examples

      iex> get_watch_later!(123)
      %WatchLater{}

      iex> get_watch_later!(456)
      ** (Ecto.NoResultsError)

  """
  def get_watch_later!(id), do: Repo.get!(WatchLater, id)

  @doc """
  Creates a watch_later.

  ## Examples

      iex> create_watch_later(%{field: value})
      {:ok, %WatchLater{}}

      iex> create_watch_later(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_watch_later(attrs \\ %{}) do
    %WatchLater{}
    |> WatchLater.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a watch_later.

  ## Examples

      iex> update_watch_later(watch_later, %{field: new_value})
      {:ok, %WatchLater{}}

      iex> update_watch_later(watch_later, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_watch_later(%WatchLater{} = watch_later, attrs) do
    watch_later
    |> WatchLater.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a watch_later.

  ## Examples

      iex> delete_watch_later(watch_later)
      {:ok, %WatchLater{}}

      iex> delete_watch_later(watch_later)
      {:error, %Ecto.Changeset{}}

  """
  def delete_watch_later(%WatchLater{} = watch_later) do
    Repo.delete(watch_later)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking watch_later changes.

  ## Examples

      iex> change_watch_later(watch_later)
      %Ecto.Changeset{data: %WatchLater{}}

  """
  def change_watch_later(%WatchLater{} = watch_later, attrs \\ %{}) do
    WatchLater.changeset(watch_later, attrs)
  end
end
