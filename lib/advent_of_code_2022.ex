defmodule AdventOfCode2022 do
  defdelegate day_1_p1, to: AdventOfCode2022.Day1, as: :highest_calorie_elf
  defdelegate day_1_p2, to: AdventOfCode2022.Day1, as: :top_3_calorie_elves
  defdelegate day_2_p1, to: AdventOfCode2022.Day2, as: :calc_score_before_tent
  defdelegate day_2_p2, to: AdventOfCode2022.Day2, as: :calc_score_after_tent
  defdelegate day_3_p1, to: AdventOfCode2022.Day3, as: :rucksack_priority_items
  defdelegate day_3_p2, to: AdventOfCode2022.Day3, as: :rucksack_priority_badges
  defdelegate day_4_p1, to: AdventOfCode2022.Day4, as: :fully_contained_assignments
  defdelegate day_4_p2, to: AdventOfCode2022.Day4, as: :overlapping_assignments
  def day_5_p1, do: AdventOfCode2022.Day5.top_crates(9000)
  def day_5_p2, do: AdventOfCode2022.Day5.top_crates(9001)
  def day_6_p1, do: AdventOfCode2022.Day6.end_of_first_packet_marker(4)
  def day_6_p2, do: AdventOfCode2022.Day6.end_of_first_packet_marker(14)
end
