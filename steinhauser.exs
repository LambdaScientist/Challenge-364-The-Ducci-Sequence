defmodule Ducci do
    @max_steps 1000
    def calc(data) do
        result = calc(data, 0, %{})
        IO.puts "#{inspect result}"
    end

    defp calc(data, steps, map) do
        new_data = 
            data |> Enum.with_index(1 - length(data)) |> Enum.map(fn {value, idx} -> abs(value - Enum.fetch!(data, idx)) end)
        cond do
            Map.has_key?(map, new_data) ->
                {:ok, steps}
            steps >= @max_steps ->
                {:error, :max_steps_exceeded}
            true ->
                calc(new_data, steps + 1, Map.put(map, new_data, steps))
        end
    end
end

challenge_input =
    [
        [1, 5, 7, 9, 9],
        [1, 2, 1, 2, 1, 0],
        [10, 12, 41, 62, 31, 50],
        [10, 12, 41, 62, 41],
    ]

challenge_input |> Enum.map(Ducci.calc()) |> Enum.each(IO.puts())
