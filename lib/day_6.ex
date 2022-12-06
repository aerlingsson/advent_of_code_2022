defmodule AdventOfCode2022.Day6 do
  @input File.read!("lib/day_6_input.txt") |> String.trim()

  def end_of_first_packet_marker(packet_length) do
    first_matching_substring =
      @input
      |> String.graphemes()
      |> Enum.chunk_every(packet_length, 1)
      |> Enum.find(&(Enum.uniq(&1) |> length == packet_length))
      |> Enum.join()

    [up_to_marker | _] = String.split(@input, first_matching_substring)
    String.length(up_to_marker) + packet_length
  end
end
