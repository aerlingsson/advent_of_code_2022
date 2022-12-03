defmodule AdventOfCode2022.Day3 do
  @item_type_priority ((?a..?z |> Enum.to_list()) ++ (?A..?Z |> Enum.to_list()))
                      |> List.to_string()
  @input File.read!("lib/day_3_input.txt")
         |> String.split("\n")
         |> Enum.reject(&(&1 == ""))

  def rucksack_priority_items do
    @input
    |> Enum.map(&String.split_at(&1, (String.length(&1) / 2) |> floor()))
    |> Enum.map(fn {compartment_1, compartment_2} ->
      compartment_1
      |> String.codepoints()
      |> Enum.find(&String.contains?(compartment_2, &1))
      |> priority_of_item()
    end)
    |> Enum.sum()
  end

  def rucksack_priority_badges do
    @input
    |> Enum.chunk_every(3)
    |> Enum.map(fn [rucksack_1, rucksack_2, rucksack_3] ->
      rucksack_1
      |> String.codepoints()
      |> Enum.find(&(String.contains?(rucksack_2, &1) and String.contains?(rucksack_3, &1)))
      |> priority_of_item()
    end)
    |> Enum.sum()
  end

  defp priority_of_item(item) do
    [characters_up_to_item_type, _rest] = String.split(@item_type_priority, item)
    String.length(characters_up_to_item_type) + 1
  end
end
