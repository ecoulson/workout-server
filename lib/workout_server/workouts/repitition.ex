defmodule WorkoutServer.Workouts.Repitition do
  use Ecto.Schema
  import Ecto.Changeset

  schema "repitition" do
    field :repitition_ended_at, :naive_datetime
    field :repitition_started_at, :naive_datetime
    field :weight, :decimal

    belongs_to :machine, WorkoutServer.Workouts.Machine

    timestamps()
  end

  @doc false
  def changeset(repitition, attrs) do
    repitition
    |> cast(attrs, [:weight, :repitition_started_at, :repitition_ended_at])
    |> validate_required([:weight, :repitition_started_at, :repitition_ended_at])
  end
end
