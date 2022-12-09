defmodule Game do
  def getHandValue(hand) do
    case hand do
      x when x in ["X", "A"] -> 1
      x when x in ["Y", "B"] -> 2
      x when x in ["Z", "C"] -> 3
    end
  end
  
  def calculateGameResultValue(hands) do
    case hands do
      {"A", "X"} -> 3
      {"C", "Z"} -> 3
      {"B", "Y"} -> 3
      {"A", "Y"} -> 6
      {"B", "Z"} -> 6
      {"C", "X"} -> 6
      _ -> 0
    end
  end 

end

case File.read("./input.txt") do
  {:ok, contents} ->
  contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn game -> 
      game_status = String.split(game, " ")
        |> List.to_tuple
      oponentHand = elem(game_status, 0)
      myHand = elem(game_status, 1)
      
      Game.calculateGameResultValue({oponentHand, myHand}) + Game.getHandValue(myHand)
    end)
    |> Enum.sum
  # |> length
  {:error, :enoent} ->  
    IO.puts "Error reding file."

end
  |> IO.inspect

  # 8625 wrong