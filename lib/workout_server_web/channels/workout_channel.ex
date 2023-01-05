defmodule WorkoutServerWeb.WorkoutChannel do
  use Phoenix.Channel

  def join("workout:" <> workout_id, _message, socket) do
    IO.puts("joined workout #{workout_id}")
    {:ok, socket}
  end
end
