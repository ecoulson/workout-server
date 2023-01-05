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
        repitition_ended_at: ~N[2023-01-02 00:02:00.00],
        repitition_started_at: ~N[2023-01-02 00:01:00.00],
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
        type: "some type"
      })
      |> WorkoutServer.Workouts.create_machine()

    machine
  end
end
