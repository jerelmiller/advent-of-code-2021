Path.join(__DIR__, "input.txt")
|> File.read!()
|> String.trim()
|> String.split(~r/\s+/)
|> Enum.map(&String.to_integer/1)
|> Enum.reduce({{nil, nil, nil}, 0}, fn
  depth, {{nil, nil, nil}, 0} ->
    {{depth, nil, nil}, 0}

  depth, {{a, nil, nil}, 0} ->
    {{a, depth, nil}, 0}

  depth, {{a, b, nil}, 0} ->
    {{a, b, depth}, 0}

  depth, {{a, b, c}, increases} ->
    case b + c + depth > a + b + c do
      true -> {{b, c, depth}, increases + 1}
      false -> {{b, c, depth}, increases}
    end
end)
|> elem(1)
|> IO.puts()
