defmodule RecipePerNote.AnnotationsTest do
  use RecipePerNote.DataCase

  alias RecipePerNote.Annotations

  describe "todos" do
    alias RecipePerNote.Annotations.ToDo

    @valid_attrs %{datelimit: ~D[2010-04-17], descri: "some descri", titles: "some titles"}
    @update_attrs %{datelimit: ~D[2011-05-18], descri: "some updated descri", titles: "some updated titles"}
    @invalid_attrs %{datelimit: nil, descri: nil, titles: nil}

    def to_do_fixture(attrs \\ %{}) do
      {:ok, to_do} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Annotations.create_to_do()

      to_do
    end

    test "list_todos/0 returns all todos" do
      to_do = to_do_fixture()
      assert Annotations.list_todos() == [to_do]
    end

    test "get_to_do!/1 returns the to_do with given id" do
      to_do = to_do_fixture()
      assert Annotations.get_to_do!(to_do.id) == to_do
    end

    test "create_to_do/1 with valid data creates a to_do" do
      assert {:ok, %ToDo{} = to_do} = Annotations.create_to_do(@valid_attrs)
      assert to_do.datelimit == ~D[2010-04-17]
      assert to_do.descri == "some descri"
      assert to_do.titles == "some titles"
    end

    test "create_to_do/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Annotations.create_to_do(@invalid_attrs)
    end

    test "update_to_do/2 with valid data updates the to_do" do
      to_do = to_do_fixture()
      assert {:ok, %ToDo{} = to_do} = Annotations.update_to_do(to_do, @update_attrs)
      assert to_do.datelimit == ~D[2011-05-18]
      assert to_do.descri == "some updated descri"
      assert to_do.titles == "some updated titles"
    end

    test "update_to_do/2 with invalid data returns error changeset" do
      to_do = to_do_fixture()
      assert {:error, %Ecto.Changeset{}} = Annotations.update_to_do(to_do, @invalid_attrs)
      assert to_do == Annotations.get_to_do!(to_do.id)
    end

    test "delete_to_do/1 deletes the to_do" do
      to_do = to_do_fixture()
      assert {:ok, %ToDo{}} = Annotations.delete_to_do(to_do)
      assert_raise Ecto.NoResultsError, fn -> Annotations.get_to_do!(to_do.id) end
    end

    test "change_to_do/1 returns a to_do changeset" do
      to_do = to_do_fixture()
      assert %Ecto.Changeset{} = Annotations.change_to_do(to_do)
    end
  end

  describe "watchlater" do
    alias RecipePerNote.Annotations.WatchLater

    @valid_attrs %{link: "some link", title: "some title"}
    @update_attrs %{link: "some updated link", title: "some updated title"}
    @invalid_attrs %{link: nil, title: nil}

    def watch_later_fixture(attrs \\ %{}) do
      {:ok, watch_later} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Annotations.create_watch_later()

      watch_later
    end

    test "list_watchlater/0 returns all watchlater" do
      watch_later = watch_later_fixture()
      assert Annotations.list_watchlater() == [watch_later]
    end

    test "get_watch_later!/1 returns the watch_later with given id" do
      watch_later = watch_later_fixture()
      assert Annotations.get_watch_later!(watch_later.id) == watch_later
    end

    test "create_watch_later/1 with valid data creates a watch_later" do
      assert {:ok, %WatchLater{} = watch_later} = Annotations.create_watch_later(@valid_attrs)
      assert watch_later.link == "some link"
      assert watch_later.title == "some title"
    end

    test "create_watch_later/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Annotations.create_watch_later(@invalid_attrs)
    end

    test "update_watch_later/2 with valid data updates the watch_later" do
      watch_later = watch_later_fixture()
      assert {:ok, %WatchLater{} = watch_later} = Annotations.update_watch_later(watch_later, @update_attrs)
      assert watch_later.link == "some updated link"
      assert watch_later.title == "some updated title"
    end

    test "update_watch_later/2 with invalid data returns error changeset" do
      watch_later = watch_later_fixture()
      assert {:error, %Ecto.Changeset{}} = Annotations.update_watch_later(watch_later, @invalid_attrs)
      assert watch_later == Annotations.get_watch_later!(watch_later.id)
    end

    test "delete_watch_later/1 deletes the watch_later" do
      watch_later = watch_later_fixture()
      assert {:ok, %WatchLater{}} = Annotations.delete_watch_later(watch_later)
      assert_raise Ecto.NoResultsError, fn -> Annotations.get_watch_later!(watch_later.id) end
    end

    test "change_watch_later/1 returns a watch_later changeset" do
      watch_later = watch_later_fixture()
      assert %Ecto.Changeset{} = Annotations.change_watch_later(watch_later)
    end
  end

  describe "notes" do
    alias RecipePerNote.Annotations.Notes

    @valid_attrs %{descri_notes: "some descri_notes", title: "some title"}
    @update_attrs %{descri_notes: "some updated descri_notes", title: "some updated title"}
    @invalid_attrs %{descri_notes: nil, title: nil}

    def notes_fixture(attrs \\ %{}) do
      {:ok, notes} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Annotations.create_notes()

      notes
    end

    test "list_notes/0 returns all notes" do
      notes = notes_fixture()
      assert Annotations.list_notes() == [notes]
    end

    test "get_notes!/1 returns the notes with given id" do
      notes = notes_fixture()
      assert Annotations.get_notes!(notes.id) == notes
    end

    test "create_notes/1 with valid data creates a notes" do
      assert {:ok, %Notes{} = notes} = Annotations.create_notes(@valid_attrs)
      assert notes.descri_notes == "some descri_notes"
      assert notes.title == "some title"
    end

    test "create_notes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Annotations.create_notes(@invalid_attrs)
    end

    test "update_notes/2 with valid data updates the notes" do
      notes = notes_fixture()
      assert {:ok, %Notes{} = notes} = Annotations.update_notes(notes, @update_attrs)
      assert notes.descri_notes == "some updated descri_notes"
      assert notes.title == "some updated title"
    end

    test "update_notes/2 with invalid data returns error changeset" do
      notes = notes_fixture()
      assert {:error, %Ecto.Changeset{}} = Annotations.update_notes(notes, @invalid_attrs)
      assert notes == Annotations.get_notes!(notes.id)
    end

    test "delete_notes/1 deletes the notes" do
      notes = notes_fixture()
      assert {:ok, %Notes{}} = Annotations.delete_notes(notes)
      assert_raise Ecto.NoResultsError, fn -> Annotations.get_notes!(notes.id) end
    end

    test "change_notes/1 returns a notes changeset" do
      notes = notes_fixture()
      assert %Ecto.Changeset{} = Annotations.change_notes(notes)
    end
  end
end
