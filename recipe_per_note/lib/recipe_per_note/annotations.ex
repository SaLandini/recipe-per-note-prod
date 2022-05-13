defmodule RecipePerNote.Annotations do
  @moduledoc """
  The Annotations context.
  """

  import Ecto.Query, warn: false
  alias RecipePerNote.Repo
  alias RecipePerNote.Annotations.ToDo

  @doc """
  Returns the list of todos.

  ## Examples

      iex> list_todos()
      [%ToDo{}, ...]

  """
  def list_todos(user) do
    ToDo
    |> where([t], t.user_id == ^user.id)
    |> preload([:user])
    |> Repo.all()
  end

  @doc """
  Returns the list of todos from given date

  ## Examples

      iex> list_todos_from_date()
      [?]
  """

  def list_todos_from_date(date) do
    ToDo
    |> where([t], t.datelimit == ^date)
    |> preload([:user])
    |> Repo.all()
  end

  @doc """
  Gets a single to_do.

  Raises `Ecto.NoResultsError` if the To do does not exist.

  ## Examples

      iex> get_to_do!(123)
      %ToDo{}

      iex> get_to_do!(456)
      ** (Ecto.NoResultsError)

  """
  def get_to_do!(id), do: Repo.get!(ToDo, id)

  @doc """
  Creates a to_do.

  ## Examples

      iex> create_to_do(%{field: value})
      {:ok, %ToDo{}}

      iex> create_to_do(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_to_do(attrs \\ %{}) do
    %ToDo{}
    |> ToDo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a to_do.

  ## Examples

      iex> update_to_do(to_do, %{field: new_value})
      {:ok, %ToDo{}}

      iex> update_to_do(to_do, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_to_do(%ToDo{} = to_do, attrs) do
    to_do
    |> ToDo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a to_do.

  ## Examples

      iex> delete_to_do(to_do)
      {:ok, %ToDo{}}

      iex> delete_to_do(to_do)
      {:error, %Ecto.Changeset{}}

  """
  def delete_to_do(%ToDo{} = to_do) do
    Repo.delete(to_do)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking to_do changes.

  ## Examples

      iex> change_to_do(to_do)
      %Ecto.Changeset{data: %ToDo{}}

  """
  def change_to_do(%ToDo{} = to_do, attrs \\ %{}) do
    ToDo.changeset(to_do, attrs)
  end

  alias RecipePerNote.Annotations.WatchLater

  @doc """
  Returns the list of watchlater.

  ## Examples

      iex> list_watchlater()
      [%WatchLater{}, ...]

  """
  def list_watchlater(user) do
    WatchLater
    |> where([w], w.user_id == ^user.id)
    |> preload([:user])
    |> Repo.all()
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

  alias RecipePerNote.Annotations.Notes

  @doc """
  Returns the list of notes.

  ## Examples

      iex> list_notes()
      [%Notes{}, ...]

  """
  def list_notes(user) do
    Notes
    |> where([n], n.user_id == ^user.id)
    |> preload([:user])
    |> Repo.all()
  end

  @doc """
  Gets a single notes.

  Raises `Ecto.NoResultsError` if the Notes does not exist.

  ## Examples

      iex> get_notes!(123)
      %Notes{}

      iex> get_notes!(456)
      ** (Ecto.NoResultsError)

  """
  def get_notes!(id), do: Repo.get!(Notes, id)

  @doc """
  Creates a notes.

  ## Examples

      iex> create_notes(%{field: value})
      {:ok, %Notes{}}

      iex> create_notes(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_notes(attrs \\ %{}) do
    %Notes{}
    |> Notes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a notes.

  ## Examples

      iex> update_notes(notes, %{field: new_value})
      {:ok, %Notes{}}

      iex> update_notes(notes, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_notes(%Notes{} = notes, attrs) do
    notes
    |> Notes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a notes.

  ## Examples

      iex> delete_notes(notes)
      {:ok, %Notes{}}

      iex> delete_notes(notes)
      {:error, %Ecto.Changeset{}}

  """
  def delete_notes(%Notes{} = notes) do
    Repo.delete(notes)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking notes changes.

  ## Examples

      iex> change_notes(notes)
      %Ecto.Changeset{data: %Notes{}}

  """
  def change_notes(%Notes{} = notes, attrs \\ %{}) do
    Notes.changeset(notes, attrs)
  end

end
