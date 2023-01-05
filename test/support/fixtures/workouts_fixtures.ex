defmodule WorkoutServer.WorkoutsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WorkoutServer.Workouts` context.
  """

  @doc """
  Generate a repitition.
  """
  def repitition_fixture(attrs \\ %{}) do
    {:ok, repitition} =
      attrs
      |> Enum.into(%{
        machine_id: "7488a646-e31f-11e4-aace-600308960662",
        repitition_ended_at: ~D[2023-01-02],
        repitition_started_at: ~D[2023-01-02],
        weight: "120.5"
      })
      |> WorkoutServer.Workouts.create_repitition()

    repitition
  end

  @doc """
  Generate a machine.
  """
  def machine_fixture(attrs \\ %{}) do
    {:ok, machine} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        id: "7488a646-e31f-11e4-aace-600308960662",
        type: "some type"
      })
      |> WorkoutServer.Workouts.create_machine()

    machine
  end
end
