letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" |> String.split("", trim: true)

case File.read("./input.txt") do
  {:ok, contents} ->
  contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn rucksack ->
      compartmentLength = round(String.length(rucksack) / 2)
      compartment_1 = String.slice(rucksack, 0,compartmentLength)
      compartment_2 = String.slice(rucksack, compartmentLength, compartmentLength)
      {compartment_1, compartment_2}
     end)
    |> Enum.map(fn {compartment_1, compartment_2} -> 
      splitted = String.split(compartment_1, "", trim: true)
      Enum.find(splitted, fn c1 -> Enum.member?(String.split(compartment_2, "", trim: true), c1) end)
      
    end)
    |> Enum.map(fn d -> 
      Enum.find_index(letters, fn x -> x == d end) + 1
    end)
    |> Enum.sum
    
  {:error, :enoent} ->  
    IO.puts "Error reding file."
end
  |> IO.inspect