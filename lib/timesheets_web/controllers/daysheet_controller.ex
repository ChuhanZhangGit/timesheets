defmodule TimesheetsWeb.DaysheetController do
  use TimesheetsWeb, :controller

  alias Timesheets.Daysheets
  alias Timesheets.Daysheets.Daysheet

  def index(conn, _params) do
    daysheets = Daysheets.list_daysheets()
    render(conn, "index.html", daysheets: daysheets)
  end

  def new(conn, _params) do
    changeset = Daysheets.change_daysheet(%Daysheet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"daysheet" => daysheet_params}) do
    case Daysheets.create_daysheet(daysheet_params) do
      {:ok, daysheet} ->
        conn
        |> put_flash(:info, "Daysheet created successfully.")
        |> redirect(to: Routes.daysheet_path(conn, :show, daysheet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    daysheet = Daysheets.get_daysheet!(id)
    render(conn, "show.html", daysheet: daysheet)
  end

  def edit(conn, %{"id" => id}) do
    daysheet = Daysheets.get_daysheet!(id)
    changeset = Daysheets.change_daysheet(daysheet)
    render(conn, "edit.html", daysheet: daysheet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "daysheet" => daysheet_params}) do
    daysheet = Daysheets.get_daysheet!(id)

    case Daysheets.update_daysheet(daysheet, daysheet_params) do
      {:ok, daysheet} ->
        conn
        |> put_flash(:info, "Daysheet updated successfully.")
        |> redirect(to: Routes.daysheet_path(conn, :show, daysheet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", daysheet: daysheet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    daysheet = Daysheets.get_daysheet!(id)
    {:ok, _daysheet} = Daysheets.delete_daysheet(daysheet)

    conn
    |> put_flash(:info, "Daysheet deleted successfully.")
    |> redirect(to: Routes.daysheet_path(conn, :index))
  end
end
