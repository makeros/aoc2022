case File.read("./input.txt") do
  {:ok, contents} ->
  contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn group -> 
      group
      |> String.split(",", trim: true)
      |> Enum.map(fn ranges -> String.split(ranges, "-", trim: true) end)
    end)
    |> Enum.map(fn group -> 

      firstSectionStart = String.to_integer(List.first(List.first(group)))
      firstSectionEnd = String.to_integer(List.last(List.first(group)))
      secondSectionStart = String.to_integer(List.first(List.last(group)))
      secondSectionEnd = String.to_integer(List.last(List.last(group)))

      firstSection = Range.new(firstSectionStart, firstSectionEnd)
      secondSection = Range.new(secondSectionStart, secondSectionEnd)

      Range.disjoint?(firstSection, secondSection)
    end)
    |> Enum.count(fn x -> x == false end)
    
  {:error, :enoent} ->  
    IO.puts "Error reding file."
end
  |> IO.inspect