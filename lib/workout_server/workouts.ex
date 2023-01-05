defmodule WorkoutServer.Workouts do
  @moduledoc """
  The Workouts context.
  """

  import Ecto.Query, warn: false
  alias WorkoutServer.Repo

  alias WorkoutServer.Workouts.Repitition

  @doc """
  Returns the list of repitition.

  ## Examples

      iex> list_repitition()
      [%Repitition{}, ...]

  """
  def list_repitition do
    Repo.all(Repitition)
  end

  @doc """
  Gets a single repitition.

  Raises `Ecto.NoResultsError` if the Repitition does not exist.

  ## Examples

      iex> get_repitition!(123)
      %Repitition{}

      iex> get_repitition!(456)
      ** (Ecto.NoResultsError)

  """
  def get_repitition!(id), do: Repo.get!(Repitition, id)

  @doc """
  Creates a repitition.

  ## Examples

      iex> create_repitition(%{field: value})
      {:ok, %Repitition{}}

      iex> create_repitition(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_repitition(attrs \\ %{}) do
    %Repitition{}
    |> Repitition.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a repitition.

  ## Examples

      iex> update_repitition(repitition, %{field: new_value})
      {:ok, %Repitition{}}

      iex> update_repitition(repitition, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_repitition(%Repitition{} = repitition, attrs) do
    repitition
    |> Repitition.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a repitition.

  ## Examples

      iex> delete_repitition(repitition)
      {:ok, %Repitition{}}

      iex> delete_repitition(repitition)
      {:error, %Ecto.Changeset{}}

  """
  def delete_repitition(%Repitition{} = repitition) do
    Repo.delete(repitition)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking repitition changes.

  ## Examples

      iex> change_repitition(repitition)
      %Ecto.Changeset{data: %Repitition{}}

  """
  def change_repitition(%Repitition{} = repitition, attrs \\ %{}) do
    Repitition.changeset(repitition, attrs)
  end

  alias WorkoutServer.Workouts.Machine

  @doc """
  Returns the list of machine.

  ## Examples

      iex> list_machine()
      [%Machine{}, ...]

  """
  def list_machine do
    Repo.all(Machine)
  end

  @doc """
  Gets a single machine.

  Raises `Ecto.NoResultsError` if the Machine does not exist.

  ## Examples

      iex> get_machine!(123)
      %Machine{}

      iex> get_machine!(456)
      ** (Ecto.NoResultsError)

  """
  def get_machine!(id), do: Repo.get!(Machine, id)

  @doc """
  Creates a machine.

  ## Examples

      iex> create_machine(%{field: value})
      {:ok, %Machine{}}

      iex> create_machine(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_machine(attrs \\ %{}) do
    %Machine{}
    |> Machine.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a machine.

  ## Examples

      iex> update_machine(machine, %{field: new_value})
      {:ok, %Machine{}}

      iex> update_machine(machine, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_machine(%Machine{} = machine, attrs) do
    machine
    |> Machine.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a machine.

  ## Examples

      iex> delete_machine(machine)
      {:ok, %Machine{}}

      iex> delete_machine(machine)
      {:error, %Ecto.Changeset{}}

  """
  def delete_machine(%Machine{} = machine) do
    Repo.delete(machine)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking machine changes.

  ## Examples

      iex> change_machine(machine)
      %Ecto.Changeset{data: %Machine{}}

  """
  def change_machine(%Machine{} = machine, attrs \\ %{}) do
    Machine.changeset(machine, attrs)
  end
end
