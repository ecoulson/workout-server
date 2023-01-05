defmodule WorkoutServer.Repo.Migrations.CreateMachine do
  use Ecto.Migration

  def change do
    create table(:machine) do
      add :id, :uuid
      add :type, :string
      add :brand, :string

      timestamps()
    end
  end
end
