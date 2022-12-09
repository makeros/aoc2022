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

  def getOppositeHand(current, direction) do
    hands = ["X", "Y", "Z"]
    case current do
      "A" -> Enum.at(hands, rem(0 + direction, 3))
      "B" -> Enum.at(hands, rem(1 + direction, 3))
      "C" -> Enum.at(hands, rem(2 + direction, 3))
    end

  end

  def predictMyHand({base_hand, end_result}) do
    case end_result do
      "X" -> {base_hand, Game.getOppositeHand(base_hand, -1)}
      "Y" -> {base_hand, Game.getOppositeHand(base_hand, 0)}
      "Z" -> {base_hand, Game.getOppositeHand(base_hand, 1)}
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
        |> Game.predictMyHand
        |> IO.inspect

      oponentHand = elem(game_status, 0)
      myHand = elem(game_status, 1)
      
      Game.calculateGameResultValue({oponentHand, myHand}) + Game.getHandValue(myHand)
    end)
    |> Enum.sum

  {:error, :enoent} ->  
    IO.puts "Error reding file."

end
  |> IO.inspect