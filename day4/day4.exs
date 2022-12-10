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

      if (firstSectionStart <= secondSectionStart and firstSectionEnd >= secondSectionEnd) or (firstSectionStart >= secondSectionStart and firstSectionEnd <= secondSectionEnd) do 
        true
      else 
        false
      end

    end)
    |> Enum.count(fn x -> x == true end)
    
  {:error, :enoent} ->  
    IO.puts "Error reding file."
end
  |> IO.inspect