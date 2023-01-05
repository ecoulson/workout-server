defmodule WorkoutServer.Workouts.Repitition do
  use Ecto.Schema
  import Ecto.Changeset

  schema "repititions" do
    field :machine_id, Ecto.UUID
    field :repitition_ended_at, :date
    field :repitition_started_at, :date
    field :weight, :decimal

    timestamps()
  end

  @doc false
  def changeset(repitition, attrs) do
    repitition
    |> cast(attrs, [:machine_id, :weight, :repitition_started_at, :repitition_ended_at])
    |> validate_required([:machine_id, :weight, :repitition_started_at, :repitition_ended_at])
  end
end
