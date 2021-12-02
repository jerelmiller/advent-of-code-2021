Path.join(__DIR__, "input.txt")
|> File.read!()
|> String.trim()
|> String.split("\n")
|> Enum.reduce({0, 0, 0}, fn instruction, {x, y, aim} ->
  [direction, amount] = String.split(instruction, ~r/\s/)
  amount = String.to_integer(amount)

  case direction do
    "forward" -> {x + amount, y + aim * amount, aim}
    "up" -> {x, y, aim - amount}
    "down" -> {x, y, aim + amount}
  end
end)
|> then(fn {x, y, _} -> x * y end)
|> IO.puts()
