defmodule WorkoutServerWeb.RepititionController do
  use WorkoutServerWeb, :controller

  alias WorkoutServer.Workouts
  alias WorkoutServer.Workouts.Repitition

  action_fallback WorkoutServerWeb.FallbackController

  def index(conn, _params) do
    repitition = Workouts.list_repitition()
    render(conn, "index.json", repitition: repitition)
  end

  def create(conn, %{"repitition" => repitition_params}) do
    with {:ok, %Repitition{} = repitition} <- Workouts.create_repitition(repitition_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.repitition_path(conn, :show, repitition))
      |> render("show.json", repitition: repitition)
    end
  end

  def show(conn, %{"id" => id}) do
    repitition = Workouts.get_repitition!(id)
    render(conn, "show.json", repitition: repitition)
  end

  def update(conn, %{"id" => id, "repitition" => repitition_params}) do
    repitition = Workouts.get_repitition!(id)

    with {:ok, %Repitition{} = repitition} <- Workouts.update_repitition(repitition, repitition_params) do
      render(conn, "show.json", repitition: repitition)
    end
  end

  def delete(conn, %{"id" => id}) do
    repitition = Workouts.get_repitition!(id)

    with {:ok, %Repitition{}} <- Workouts.delete_repitition(repitition) do
      send_resp(conn, :no_content, "")
    end
  end
end
