defmodule WorkoutServer.WorkoutsTest do
  use WorkoutServer.DataCase

  alias WorkoutServer.Workouts

  describe "repitition" do
    alias WorkoutServer.Workouts.Repitition

    import WorkoutServer.WorkoutsFixtures

    @invalid_attrs %{repitition_ended_at: nil, repitition_started_at: nil, weight: nil}

    test "list_repitition/0 returns all repitition" do
      repitition = repitition_fixture()
      assert Workouts.list_repitition() == [repitition]
    end

    test "get_repitition!/1 returns the repitition with given id" do
      repitition = repitition_fixture()
      assert Workouts.get_repitition!(repitition.id) == repitition
    end

    test "create_repitition/1 with valid data creates a repitition" do
      valid_attrs = %{repitition_ended_at: ~N[2023-01-02 00:02:00.00], repitition_started_at: ~N[2023-01-02 00:01:00.00], weight: "120.5"}

      assert {:ok, %Repitition{} = repitition} = Workouts.create_repitition(valid_attrs)
      assert repitition.repitition_ended_at == ~N[2023-01-02 00:02:00]
      assert repitition.repitition_started_at == ~N[2023-01-02 00:01:00]
      assert repitition.weight == Decimal.new("120.5")
    end

    test "create_repitition/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workouts.create_repitition(@invalid_attrs)
    end

    test "update_repitition/2 with valid data updates the repitition" do
      repitition = repitition_fixture()
      update_attrs = %{repitition_ended_at: ~N[2023-01-02 00:02:00.00], repitition_started_at: ~N[2023-01-02 00:01:00.00], weight: "456.7"}

      assert {:ok, %Repitition{} = repitition} = Workouts.update_repitition(repitition, update_attrs)
      assert repitition.repitition_ended_at == ~N[2023-01-02 00:02:00]
      assert repitition.repitition_started_at == ~N[2023-01-02 00:01:00]
      assert repitition.weight == Decimal.new("456.7")
    end

    test "update_repitition/2 with invalid data returns error changeset" do
      repitition = repitition_fixture()
      assert {:error, %Ecto.Changeset{}} = Workouts.update_repitition(repitition, @invalid_attrs)
      assert repitition == Workouts.get_repitition!(repitition.id)
    end

    test "delete_repitition/1 deletes the repitition" do
      repitition = repitition_fixture()
      assert {:ok, %Repitition{}} = Workouts.delete_repitition(repitition)
      assert_raise Ecto.NoResultsError, fn -> Workouts.get_repitition!(repitition.id) end
    end

    test "change_repitition/1 returns a repitition changeset" do
      repitition = repitition_fixture()
      assert %Ecto.Changeset{} = Workouts.change_repitition(repitition)
    end
  end

  describe "machine" do
    alias WorkoutServer.Workouts.Machine

    import WorkoutServer.WorkoutsFixtures

    @invalid_attrs %{brand: nil, id: nil, type: nil}

    test "list_machine/0 returns all machine" do
      machine = machine_fixture()
      assert Workouts.list_machine() == [machine]
    end

    test "get_machine!/1 returns the machine with given id" do
      machine = machine_fixture()
      assert Workouts.get_machine!(machine.id) == machine
    end

    test "create_machine/1 with valid data creates a machine" do
      valid_attrs = %{brand: "some brand", type: "some type"}

      assert {:ok, %Machine{} = machine} = Workouts.create_machine(valid_attrs)
      assert machine.brand == "some brand"
      assert machine.type == "some type"
    end

    test "create_machine/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workouts.create_machine(@invalid_attrs)
    end

    test "update_machine/2 with valid data updates the machine" do
      machine = machine_fixture()
      update_attrs = %{brand: "some updated brand", id: "7488a646-e31f-11e4-aace-600308960668", type: "some updated type"}

      assert {:ok, %Machine{} = machine} = Workouts.update_machine(machine, update_attrs)
      assert machine.brand == "some updated brand"
      assert machine.type == "some updated type"
    end

    test "update_machine/2 with invalid data returns error changeset" do
      machine = machine_fixture()
      assert {:error, %Ecto.Changeset{}} = Workouts.update_machine(machine, @invalid_attrs)
      assert machine == Workouts.get_machine!(machine.id)
    end

    test "delete_machine/1 deletes the machine" do
      machine = machine_fixture()
      assert {:ok, %Machine{}} = Workouts.delete_machine(machine)
      assert_raise Ecto.NoResultsError, fn -> Workouts.get_machine!(machine.id) end
    end

    test "change_machine/1 returns a machine changeset" do
      machine = machine_fixture()
      assert %Ecto.Changeset{} = Workouts.change_machine(machine)
    end
  end
end
