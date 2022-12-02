defmodule AdventOfCode2022.Day2 do
  @moduledoc """
  You could take this a step further, and do arithmetic on the codepoints, but this is the straightforward solution
  """

  @input File.read!("lib/day_2_input.txt")
         |> String.split("\n")
         |> Enum.reject(&(&1 == ""))
         |> Enum.map(
           &(&1
             |> String.replace("X", "A")
             |> String.replace("Y", "B")
             |> String.replace("Z", "C")
             |> String.split(" "))
         )

  @points_per_move %{
    "A" => 1,
    "B" => 2,
    "C" => 3
  }

  def calc_score_before_tent do
    @input
    |> Enum.map(fn [opp_move, my_move] ->
      move_score = Map.fetch!(@points_per_move, my_move)

      cond do
        my_move == opp_move -> 3 + move_score
        my_move == "B" and opp_move == "A" -> 6 + move_score
        my_move == "C" and opp_move == "B" -> 6 + move_score
        my_move == "A" and opp_move == "C" -> 6 + move_score
        true -> 0 + move_score
      end
    end)
    |> Enum.sum()
  end

  def calc_score_after_tent do
    points_per_outcome = %{
      "A" => 0,
      "B" => 3,
      "C" => 6
    }

    @input
    |> Enum.map(fn [opp_move, outcome] ->
      outcome_score = Map.fetch!(points_per_outcome, outcome)

      cond do
        outcome == "B" -> outcome_score + Map.fetch!(@points_per_move, opp_move)
        outcome == "C" and opp_move == "A" -> outcome_score + Map.fetch!(@points_per_move, "B")
        outcome == "C" and opp_move == "B" -> outcome_score + Map.fetch!(@points_per_move, "C")
        outcome == "C" and opp_move == "C" -> outcome_score + Map.fetch!(@points_per_move, "A")
        outcome == "A" and opp_move == "A" -> outcome_score + Map.fetch!(@points_per_move, "C")
        outcome == "A" and opp_move == "B" -> outcome_score + Map.fetch!(@points_per_move, "A")
        outcome == "A" and opp_move == "C" -> outcome_score + Map.fetch!(@points_per_move, "B")
      end
    end)
    |> Enum.sum()
  end
end
