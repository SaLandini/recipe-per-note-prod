defmodule RecipePerNoteWeb.ToDoLiveTest do
  use RecipePerNoteWeb.ConnCase

  import Phoenix.LiveViewTest

  import RecipePerNote.AccountsFixtures
  alias RecipePerNote.Accounts.{User, UserToken}

  alias RecipePerNote.Annotations

  setup do
    %{user: user_fixture()}
  end

  @create_attrs %{datelimit: ~D[2010-04-17], descri: "some descri", titles: "some titles", author: User}
  @update_attrs %{datelimit: ~D[2011-05-18], descri: "some updated descri", titles: "some updated titles", author: User}
  @invalid_attrs %{datelimit: nil, descri: nil, titles: nil, author: nil}

  defp fixture(:to_do) do
    {:ok, to_do} = Annotations.create_to_do(@create_attrs)
    to_do
  end

  defp create_to_do(_) do
    to_do = fixture(:to_do)
    %{to_do: to_do}
  end

  describe "Index" do
    setup [:create_to_do]

    test "lists all todos", %{conn: conn, to_do: to_do} do
      {:ok, _index_live, html} = live(conn, Routes.to_do_index_path(conn, :index))

      assert html =~ "Listing Todos"
      assert html =~ to_do.descri
    end

    test "saves new to_do", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.to_do_index_path(conn, :index))

      assert index_live |> element("a", "New To do") |> render_click() =~
               "New To do"

      assert_patch(index_live, Routes.to_do_index_path(conn, :new))

      assert index_live
             |> form("#to_do-form", to_do: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#to_do-form", to_do: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.to_do_index_path(conn, :index))

      assert html =~ "To do created successfully"
      assert html =~ "some descri"
    end

    test "updates to_do in listing", %{conn: conn, to_do: to_do} do
      {:ok, index_live, _html} = live(conn, Routes.to_do_index_path(conn, :index))

      assert index_live |> element("#to_do-#{to_do.id} a", "Edit") |> render_click() =~
               "Edit To do"

      assert_patch(index_live, Routes.to_do_index_path(conn, :edit, to_do))

      assert index_live
             |> form("#to_do-form", to_do: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#to_do-form", to_do: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.to_do_index_path(conn, :index))

      assert html =~ "To do updated successfully"
      assert html =~ "some updated descri"
    end

    test "deletes to_do in listing", %{conn: conn, to_do: to_do} do
      {:ok, index_live, _html} = live(conn, Routes.to_do_index_path(conn, :index))

      assert index_live |> element("#to_do-#{to_do.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#to_do-#{to_do.id}")
    end
  end

  describe "Show" do
    setup [:create_to_do]

    test "displays to_do", %{conn: conn, to_do: to_do} do
      {:ok, _show_live, html} = live(conn, Routes.to_do_show_path(conn, :show, to_do))

      assert html =~ "Show To do"
      assert html =~ to_do.descri
    end

    test "updates to_do within modal", %{conn: conn, to_do: to_do} do
      {:ok, show_live, _html} = live(conn, Routes.to_do_show_path(conn, :show, to_do))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit To do"

      assert_patch(show_live, Routes.to_do_show_path(conn, :edit, to_do))

      assert show_live
             |> form("#to_do-form", to_do: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#to_do-form", to_do: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.to_do_show_path(conn, :show, to_do))

      assert html =~ "To do updated successfully"
      assert html =~ "some updated descri"
    end
  end
end
