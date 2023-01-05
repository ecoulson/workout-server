defmodule WorkoutServerWeb.MachineView do
  use WorkoutServerWeb, :view
  alias WorkoutServerWeb.MachineView

  def render("index.json", %{machine: machine}) do
    %{data: render_many(machine, MachineView, "machine.json")}
  end

  def render("show.json", %{machine: machine}) do
    %{data: render_one(machine, MachineView, "machine.json")}
  end

  def render("machine.json", %{machine: machine}) do
    %{
      id: machine.id,
      type: machine.type,
      brand: machine.brand
    }
  end
end
