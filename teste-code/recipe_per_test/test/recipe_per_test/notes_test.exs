defmodule RecipePerTest.NotesTest do
  use RecipePerTest.DataCase

  alias RecipePerTest.Notes

  describe "watchlaters" do
    alias RecipePerTest.Notes.WatchLater

    @valid_attrs %{link: "some link"}
    @update_attrs %{link: "some updated link"}
    @invalid_attrs %{link: nil}

    def watch_later_fixture(attrs \\ %{}) do
      user = user_fixture()

      {:ok, watch_later} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Enum.into(%{user_id: user.id})
        |> Notes.create_watch_later()

      watch_later
    end

    test "list_watchlaters/0 returns all watchlaters" do
      watch_later = watch_later_fixture()
      assert Notes.list_watchlaters() == [watch_later]
    end

    test "get_watch_later!/1 returns the watch_later with given id" do
      watch_later = watch_later_fixture()
      assert Notes.get_watch_later!(watch_later.id) == watch_later
    end

    test "create_watch_later/1 with valid data creates a watch_later" do
      user = user_fixture()
      create_attributes = Enum.into(%{user_id: user.id}, @valid_attrs)

      assert {:ok, %WatchLater{} = watch_later} = Notes.create_watch_later(create_attributes)
      assert watch_later.link == "some link"
      assert watch_later.user_id == user.id
    end

    test "create_watch_later/1 with invalid data returns error changeset" do
      user = user_fixture()
      create_attributes = Enum.into(%{user_id: user.id}, @invalid_attrs)
      assert {:error, %Ecto.Changeset{}} = Notes.create_watch_later(create_attributes)
    end

    test "update_watch_later/2 with valid data updates the watch_later" do
      watch_later = watch_later_fixture()
      assert {:ok, %WatchLater{} = watch_later} = Notes.update_watch_later(watch_later, @update_attrs)
      assert watch_later.link == "some updated link"
    end

    test "update_watch_later/2 with invalid data returns error changeset" do
      watch_later = watch_later_fixture()
      assert {:error, %Ecto.Changeset{}} = Notes.update_watch_later(watch_later, @invalid_attrs)
      assert watch_later == Notes.get_watch_later!(watch_later.id)
    end

    test "delete_watch_later/1 deletes the watch_later" do
      watch_later = watch_later_fixture()
      assert {:ok, %WatchLater{}} = Notes.delete_watch_later(watch_later)
      assert_raise Ecto.NoResultsError, fn -> Notes.get_watch_later!(watch_later.id) end
    end

    test "change_watch_later/1 returns a watch_later changeset" do
      watch_later = watch_later_fixture()
      assert %Ecto.Changeset{} = Notes.change_watch_later(watch_later)
    end
  end
end
