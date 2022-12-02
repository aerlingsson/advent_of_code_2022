defmodule AdventOfCode2022 do
  defdelegate day_1_p1, to: AdventOfCode2022.Day1, as: :highest_calorie_elf
  defdelegate day_1_p2, to: AdventOfCode2022.Day1, as: :top_3_calorie_elves
  defdelegate day_2_p1, to: AdventOfCode2022.Day2, as: :calc_score_before_tent
  defdelegate day_2_p2, to: AdventOfCode2022.Day2, as: :calc_score_after_tent
end
