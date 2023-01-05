defmodule WorkoutServer.Workouts.Machine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "machine" do
    field :brand, :string
    field :id, Ecto.UUID
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(machine, attrs) do
    machine
    |> cast(attrs, [:id, :type, :brand])
    |> validate_required([:id, :type, :brand])
  end
end
