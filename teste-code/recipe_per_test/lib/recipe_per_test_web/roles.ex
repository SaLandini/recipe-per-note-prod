defmodule RecipePerTestWeb.Roles do
  @moduledoc """
  Defines roles related functions.
  """

  alias RecipePerTest.Accounts.User
  alias RecipePerTest.Notes.WatchLater


  @type entity :: struct()
  @type action :: :new | :index | :edit | :show | :delete

  @spec can?(%User{}, entity(), action()) :: boolean()
  def can?(user, entity, action)
  def can?(%User{role: :admin}, %WatchLater{}, _any), do: true
  def can?(%User{}, %WatchLater{}, :new), do: true
  def can?(%User{id: id}, %WatchLater{user_id: id}, :edit), do: true
  def can?(%User{id: id}, %WatchLater{user_id: id}, :delete), do: true
  def can?(_, _, _), do: false
end
