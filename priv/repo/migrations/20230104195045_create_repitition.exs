defmodule WorkoutServer.Repo.Migrations.CreateRepitition do
  use Ecto.Migration

  def change do
    create table(:repitition) do
      add :machine_id, :uuid
      add :weight, :decimal
      add :repitition_started_at, :date
      add :repitition_ended_at, :date

      timestamps()
    end
  end
end
