defmodule WorkoutServerWeb.MachineController do
  use WorkoutServerWeb, :controller

  alias WorkoutServer.Workouts
  alias WorkoutServer.Workouts.Machine

  action_fallback WorkoutServerWeb.FallbackController

  def index(conn, _params) do
    machine = Workouts.list_machine()
    render(conn, "index.json", machine: machine)
  end

  def create(conn, %{"machine" => machine_params}) do
    with {:ok, %Machine{} = machine} <- Workouts.create_machine(machine_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.machine_path(conn, :show, machine))
      |> render("show.json", machine: machine)
    end
  end

  def show(conn, %{"id" => id}) do
    machine = Workouts.get_machine!(id)
    render(conn, "show.json", machine: machine)
  end

  def update(conn, %{"id" => id, "machine" => machine_params}) do
    machine = Workouts.get_machine!(id)

    with {:ok, %Machine{} = machine} <- Workouts.update_machine(machine, machine_params) do
      render(conn, "show.json", machine: machine)
    end
  end

  def delete(conn, %{"id" => id}) do
    machine = Workouts.get_machine!(id)

    with {:ok, %Machine{}} <- Workouts.delete_machine(machine) do
      send_resp(conn, :no_content, "")
    end
  end
end
