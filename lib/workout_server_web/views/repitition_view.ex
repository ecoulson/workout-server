defmodule WorkoutServerWeb.RepititionView do
  use WorkoutServerWeb, :view
  alias WorkoutServerWeb.RepititionView

  def render("index.json", %{repitition: repitition}) do
    %{data: render_many(repitition, RepititionView, "repitition.json")}
  end

  def render("show.json", %{repitition: repitition}) do
    %{data: render_one(repitition, RepititionView, "repitition.json")}
  end

  def render("repitition.json", %{repitition: repitition}) do
    %{
      id: repitition.id,
      machine: repitition.machine,
      weight: repitition.weight,
      repitition_started_at: repitition.repitition_started_at,
      repitition_ended_at: repitition.repitition_ended_at
    }
  end
end
