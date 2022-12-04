defmodule AdventOfCode2022.Day4 do
  @input File.read!("lib/day_4_input.txt")
         |> String.split("\n")
         |> Enum.map(&String.split(&1, ","))
         |> Enum.reject(&(&1 == [""]))
         |> Enum.map(fn str_pairs ->
           Enum.map(str_pairs, fn str_range ->
             String.split(str_range, "-")
             |> then(fn [range_start, range_end] ->
               String.to_integer(range_start)..String.to_integer(range_end)
             end)
           end)
         end)

  def fully_contained_assignments do
    fully_contained? = fn r1, r2 ->
      if r1.first <= r2.first and r1.last >= r2.last do
        true
      else
        false
      end
    end

    @input
    |> Enum.count(fn [r1, r2] -> fully_contained?.(r1, r2) or fully_contained?.(r2, r1) end)
  end

  def overlapping_assignments do
    overlapping? = fn r1, r2 ->
      Enum.any?(r2, &(&1 >= r1.first and &1 <= r1.last))
    end

    @input |> Enum.count(fn [r1, r2] -> overlapping?.(r1, r2) end)
  end
end
