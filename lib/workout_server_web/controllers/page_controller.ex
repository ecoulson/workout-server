defmodule WorkoutServerWeb.PageController do
  use WorkoutServerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
