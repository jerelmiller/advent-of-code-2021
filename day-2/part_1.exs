Path.join(__DIR__, "input.txt")
|> File.read!()
|> String.trim()
|> String.split("\n")
|> Enum.reduce({0, 0}, fn instruction, {x, y} ->
  [direction, amount] = String.split(instruction, ~r/\s/)
  amount = String.to_integer(amount)

  case direction do
    "forward" -> {x + amount, y}
    "up" -> {x, y - amount}
    "down" -> {x, y + amount}
  end
end)
|> then(fn {x, y} -> x * y end)
|> IO.puts()
