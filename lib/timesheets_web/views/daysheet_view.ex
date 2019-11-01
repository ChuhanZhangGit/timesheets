defmodule TimesheetsWeb.DaysheetView do
  use TimesheetsWeb, :view

  def get_user_name_by_id(id) do
    Timesheets.Users.get_user(id).name
  end
  
  def get_all_job_code() do
    Timesheets.Jobs.list_jobs()
    |> Enum.map(fn job -> job.jobcode end)
  end
end
