defmodule TimesheetsWeb.DaysheetControllerTest do
  use TimesheetsWeb.ConnCase

  alias Timesheets.Daysheets

  @create_attrs %{approved: true, date: ~D[2010-04-17]}
  @update_attrs %{approved: false, date: ~D[2011-05-18]}
  @invalid_attrs %{approved: nil, date: nil}

  def fixture(:daysheet) do
    {:ok, daysheet} = Daysheets.create_daysheet(@create_attrs)
    daysheet
  end

  describe "index" do
    test "lists all daysheets", %{conn: conn} do
      conn = get(conn, Routes.daysheet_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Daysheets"
    end
  end

  describe "new daysheet" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.daysheet_path(conn, :new))
      assert html_response(conn, 200) =~ "New Daysheet"
    end
  end

  describe "create daysheet" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.daysheet_path(conn, :create), daysheet: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.daysheet_path(conn, :show, id)

      conn = get(conn, Routes.daysheet_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Daysheet"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.daysheet_path(conn, :create), daysheet: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Daysheet"
    end
  end

  describe "edit daysheet" do
    setup [:create_daysheet]

    test "renders form for editing chosen daysheet", %{conn: conn, daysheet: daysheet} do
      conn = get(conn, Routes.daysheet_path(conn, :edit, daysheet))
      assert html_response(conn, 200) =~ "Edit Daysheet"
    end
  end

  describe "update daysheet" do
    setup [:create_daysheet]

    test "redirects when data is valid", %{conn: conn, daysheet: daysheet} do
      conn = put(conn, Routes.daysheet_path(conn, :update, daysheet), daysheet: @update_attrs)
      assert redirected_to(conn) == Routes.daysheet_path(conn, :show, daysheet)

      conn = get(conn, Routes.daysheet_path(conn, :show, daysheet))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, daysheet: daysheet} do
      conn = put(conn, Routes.daysheet_path(conn, :update, daysheet), daysheet: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Daysheet"
    end
  end

  describe "delete daysheet" do
    setup [:create_daysheet]

    test "deletes chosen daysheet", %{conn: conn, daysheet: daysheet} do
      conn = delete(conn, Routes.daysheet_path(conn, :delete, daysheet))
      assert redirected_to(conn) == Routes.daysheet_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.daysheet_path(conn, :show, daysheet))
      end
    end
  end

  defp create_daysheet(_) do
    daysheet = fixture(:daysheet)
    {:ok, daysheet: daysheet}
  end
end
