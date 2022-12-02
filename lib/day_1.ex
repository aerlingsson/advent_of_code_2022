defmodule AdventOfCode2022.Day1 do
  @input File.read!("lib/day_1_input.txt")
         |> String.split("\n\n")
         |> Enum.map(&String.split(&1, "\n"))
         |> Enum.map(fn str_lst ->
           str_lst |> Enum.reject(&(&1 == "")) |> Enum.map(&String.to_integer/1)
         end)

  def highest_calorie_elf do
    @input
    |> Enum.map(&Enum.sum/1)
    |> Enum.max()
  end

  def top_3_calorie_elves do
    @input
    |> Enum.map(&Enum.sum/1)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end
end
