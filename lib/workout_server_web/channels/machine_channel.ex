defmodule WorkoutServerWeb.MachineChannel do
  use Phoenix.Channel

  def join("machine:" <> workout_id, _message, socket) do
    IO.puts("joined machine #{workout_id}")
    {:ok, socket}
  end
end
