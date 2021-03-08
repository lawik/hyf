defmodule Hyf.Storage do
  @dir "tmp"
  def put(name, data) do
    File.mkdir_p!(@dir)
    File.write!(Path.join(@dir, "#{name}.json"), Jason.encode!(data))
    Phoenix.PubSub.broadcast(Hyf.PubSub, "changes", :change)
  end

  def get(name) do
    case File.read(Path.join(@dir, "#{name}.json")) do
      {:ok, content} -> Jason.decode!(content)
      {:error, _} -> nil
    end
  end

  def list do
    case File.ls(@dir) do
      {:ok, files} -> files
      {:error, _} -> []
    end
  end

  def read_all do
    list()
    |> Enum.reduce(%{}, fn filename, dataset ->
      name = Path.basename(filename, ".json")
      data = get(name)
      results =
        try do
          %{total_tests: Map.get(data, "numTotalTests", 0), passed_tests: Map.get(data, "numPassedTests", 0)}
        rescue
          _ -> "Invalid results"
        end
      Map.put(dataset, name, results)
    end)
  end
end
