defmodule Renderer do
  require EEx

  EEx.function_from_file(:defp, :do_render, "lib/renderer/template.html.eex", [:json])

  def render(graph) do
    graph
    |> Jason.encode!()
    |> do_render()
  end
end
