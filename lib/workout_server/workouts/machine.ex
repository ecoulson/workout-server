defmodule WorkoutServer.Workouts.Machine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "machine" do
    field :brand, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(machine, attrs) do
    machine
    |> cast(attrs, [:type, :brand])
    |> validate_required([:type, :brand])
  end
end
