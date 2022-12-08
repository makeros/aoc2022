# import File

{:ok, content } = File.read("./input.txt")
String.split(content, "\n\n", trim: true)
  |> Enum.map(&String.split/1)
  |> Enum.with_index(fn element, index -> {index + 1, element} end)
  |> Enum.map(fn {index, elf} -> 
    # IO.inspect(elf)
    {index, Enum.reduce(elf, 0, fn cal, acc -> String.to_integer(cal) + acc end )}
  end)
  # |> Enum.max_by(fn {index, elf_calories} -> elf_calories end)
  |> Enum.sort_by(fn {_index, elf_calories} -> elf_calories end)
  |> Enum.take(-3)
  |> Enum.map(fn {_index, calories} -> calories end)
  |> Enum.sum
  |> IO.inspect

  # |> Enum.with_index(1)
  # |> Enum.max
  # |> Enum.map_reduce(0, fn x, acc -> {x > acc, x + acc} end)


# IO.inspect(result)
# defmodule Solver do
  
#   def main([]), do: main(["-f", "input.txt"])
  
#   def main(["-f" , filename]) do
#     IO.puts("This is Elixir code. Config file is #{filename}")
#     {_res, bind} = Code.eval_file(filename)
#     IO.puts("Result=#{inspect(bind, pretty: true)}")
    
#   end
  
#   def main(any) do
#     IO.puts("Error in argument list #{inspect(any)}")
#   end
# end