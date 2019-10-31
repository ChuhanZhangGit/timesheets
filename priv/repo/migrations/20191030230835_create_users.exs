defmodule Timesheets.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :group, :string, null: false
      add :email, :string, null: false
      add :name, :string, null: false
      add :manager, :string, null: true

      timestamps()
    end

  end
end
