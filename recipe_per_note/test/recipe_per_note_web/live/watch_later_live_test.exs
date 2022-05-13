defmodule RecipePerNoteWeb.WatchLaterLiveTest do
  use RecipePerNoteWeb.ConnCase

  import Phoenix.LiveViewTest

  alias RecipePerNote.Annotations

  @create_attrs %{link: "some link", title: "some title"}
  @update_attrs %{link: "some updated link", title: "some updated title"}
  @invalid_attrs %{link: nil, title: nil}

  defp fixture(:watch_later) do
    {:ok, watch_later} = Annotations.create_watch_later(@create_attrs)
    watch_later
  end

  defp create_watch_later(_) do
    watch_later = fixture(:watch_later)
    %{watch_later: watch_later}
  end

  describe "Index" do
    setup [:create_watch_later]

    test "lists all watchlater", %{conn: conn, watch_later: watch_later} do
      {:ok, _index_live, html} = live(conn, Routes.watch_later_index_path(conn, :index))

      assert html =~ "Listing Watchlater"
      assert html =~ watch_later.link
    end

    test "saves new watch_later", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.watch_later_index_path(conn, :index))

      assert index_live |> element("a", "New Watch later") |> render_click() =~
               "New Watch later"

      assert_patch(index_live, Routes.watch_later_index_path(conn, :new))

      assert index_live
             |> form("#watch_later-form", watch_later: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#watch_later-form", watch_later: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.watch_later_index_path(conn, :index))

      assert html =~ "Watch later created successfully"
      assert html =~ "some link"
    end

    test "updates watch_later in listing", %{conn: conn, watch_later: watch_later} do
      {:ok, index_live, _html} = live(conn, Routes.watch_later_index_path(conn, :index))

      assert index_live |> element("#watch_later-#{watch_later.id} a", "Edit") |> render_click() =~
               "Edit Watch later"

      assert_patch(index_live, Routes.watch_later_index_path(conn, :edit, watch_later))

      assert index_live
             |> form("#watch_later-form", watch_later: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#watch_later-form", watch_later: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.watch_later_index_path(conn, :index))

      assert html =~ "Watch later updated successfully"
      assert html =~ "some updated link"
    end

    test "deletes watch_later in listing", %{conn: conn, watch_later: watch_later} do
      {:ok, index_live, _html} = live(conn, Routes.watch_later_index_path(conn, :index))

      assert index_live |> element("#watch_later-#{watch_later.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#watch_later-#{watch_later.id}")
    end
  end

  describe "Show" do
    setup [:create_watch_later]

    test "displays watch_later", %{conn: conn, watch_later: watch_later} do
      {:ok, _show_live, html} = live(conn, Routes.watch_later_show_path(conn, :show, watch_later))

      assert html =~ "Show Watch later"
      assert html =~ watch_later.link
    end

    test "updates watch_later within modal", %{conn: conn, watch_later: watch_later} do
      {:ok, show_live, _html} = live(conn, Routes.watch_later_show_path(conn, :show, watch_later))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Watch later"

      assert_patch(show_live, Routes.watch_later_show_path(conn, :edit, watch_later))

      assert show_live
             |> form("#watch_later-form", watch_later: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#watch_later-form", watch_later: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.watch_later_show_path(conn, :show, watch_later))

      assert html =~ "Watch later updated successfully"
      assert html =~ "some updated link"
    end
  end
end
