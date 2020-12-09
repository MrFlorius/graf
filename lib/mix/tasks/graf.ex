defmodule Mix.Tasks.Graf do
  use Mix.Task

  def run(args) do
    {options, _, []} =
      OptionParser.parse(
        args,
        switches: [depth: :integer, builtin: :boolean]
      )

    depth = Keyword.get(options, :depth, 0)
    include_builtin = Keyword.get(options, :builtin, false)

    Graf.from_projects([File.cwd!()], depth, include_builtin)
    # |> IO.inspect()
    |> Renderer.render()
    |> save()
  end

  defp save(content) do
    File.write("graf.html", content)
  end
end
