Path.join(__DIR__, "input.txt")
|> File.read!()
|> String.trim()
|> String.split(~r/\s+/)
|> Enum.map(&String.to_integer/1)
|> Enum.reduce({nil, 0}, fn
  depth, {nil, 0} ->
    {depth, 0}

  depth, {previous_depth, increases} ->
    case depth > previous_depth do
      true -> {depth, increases + 1}
      false -> {depth, increases}
    end
end)
|> elem(1)
|> IO.puts()
