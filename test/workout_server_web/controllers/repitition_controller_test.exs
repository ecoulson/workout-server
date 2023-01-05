defmodule WorkoutServerWeb.RepititionControllerTest do
  use WorkoutServerWeb.ConnCase

  import WorkoutServer.WorkoutsFixtures

  alias WorkoutServer.Workouts.Repitition

  @create_attrs %{
    machine_id: "7488a646-e31f-11e4-aace-600308960662",
    repitition_ended_at: ~D[2023-01-03],
    repitition_started_at: ~D[2023-01-03],
    weight: "120.5"
  }
  @update_attrs %{
    machine_id: "7488a646-e31f-11e4-aace-600308960668",
    repitition_ended_at: ~D[2023-01-04],
    repitition_started_at: ~D[2023-01-04],
    weight: "456.7"
  }
  @invalid_attrs %{machine_id: nil, repitition_ended_at: nil, repitition_started_at: nil, weight: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all repitition", %{conn: conn} do
      conn = get(conn, Routes.repitition_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create repitition" do
    test "renders repitition when data is valid", %{conn: conn} do
      conn = post(conn, Routes.repitition_path(conn, :create), repitition: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.repitition_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "machine_id" => "7488a646-e31f-11e4-aace-600308960662",
               "repitition_ended_at" => "2023-01-03",
               "repitition_started_at" => "2023-01-03",
               "weight" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.repitition_path(conn, :create), repitition: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update repitition" do
    setup [:create_repitition]

    test "renders repitition when data is valid", %{conn: conn, repitition: %Repitition{id: id} = repitition} do
      conn = put(conn, Routes.repitition_path(conn, :update, repitition), repitition: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.repitition_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "machine_id" => "7488a646-e31f-11e4-aace-600308960668",
               "repitition_ended_at" => "2023-01-04",
               "repitition_started_at" => "2023-01-04",
               "weight" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, repitition: repitition} do
      conn = put(conn, Routes.repitition_path(conn, :update, repitition), repitition: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete repitition" do
    setup [:create_repitition]

    test "deletes chosen repitition", %{conn: conn, repitition: repitition} do
      conn = delete(conn, Routes.repitition_path(conn, :delete, repitition))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.repitition_path(conn, :show, repitition))
      end
    end
  end

  defp create_repitition(_) do
    repitition = repitition_fixture()
    %{repitition: repitition}
  end
end
