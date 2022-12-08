{:ok, content } = File.read("./input.txt")
String.split(content, "\n\n", trim: true)
  |> Enum.map(&String.split/1)
  |> Enum.with_index(fn element, index -> {index + 1, element} end)
  |> Enum.map(fn {index, elf} -> 
    {index, Enum.reduce(elf, 0, fn cal, acc -> String.to_integer(cal) + acc end )}
  end)
  # |> Enum.max_by(fn {index, elf_calories} -> elf_calories end)
  |> Enum.sort_by(fn {_index, elf_calories} -> elf_calories end)
  |> Enum.take(-3)
  |> Enum.map(fn {_index, calories} -> calories end)
  |> Enum.sum
  |> IO.inspect
