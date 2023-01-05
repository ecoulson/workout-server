defmodule WorkoutServer.Repo.Migrations.CreateRepitition do
  use Ecto.Migration

  def change do
    create table(:repitition) do
      add :machine_id, references(:machine)
      add :weight, :decimal
      add :repitition_started_at, :naive_datetime
      add :repitition_ended_at, :naive_datetime

      timestamps()
    end

    create index(:repitition, [:machine_id])
  end
end
