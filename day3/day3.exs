letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" |> String.split("", trim: true)

case File.read("./input.txt") do
  {:ok, contents} ->
  contents
    |> String.split("\n", trim: true)
    |> Enum.chunk_every(3)
    |> Enum.map(fn  [rucksack_1, rucksack_2, rucksack_3]-> 
      splitted = String.split(rucksack_1, "", trim: true)
      Enum.find(splitted, fn c1 -> 
        Enum.member?(String.split(rucksack_2, "", trim: true), c1)
        and Enum.member?(String.split(rucksack_3, "", trim: true), c1) 
      end)
      
    end)
    |> Enum.map(fn d -> 
      Enum.find_index(letters, fn x -> x == d end) + 1
    end)
    |> Enum.sum
    
  {:error, :enoent} ->  
    IO.puts "Error reding file."
end
  |> IO.inspect