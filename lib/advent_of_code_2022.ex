defmodule AdventOfCode2022 do
  defdelegate day_1_p1, to: AdventOfCode2022.Day1, as: :highest_calorie_elf
  defdelegate day_1_p2, to: AdventOfCode2022.Day1, as: :top_3_calorie_elves
end
