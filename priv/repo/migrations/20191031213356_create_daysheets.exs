defmodule Timesheets.Repo.Migrations.CreateDaysheets do
  use Ecto.Migration

  def change do
    create table(:daysheets) do
      add :date, :date, null: false
      add :approved, :boolean, default: false, null: false
      add :manager_id, references(:users, on_delete: :nothing), null: false
      add :worker_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:daysheets, [:manager_id])
    create index(:daysheets, [:worker_id])
  end
end
