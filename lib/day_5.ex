defmodule AdventOfCode2022.Day5 do
  @input File.read!("lib/day_5_input.txt")

  def top_crates(crane) do
    [stacks, instructions] = String.split(@input, "\n\n")
    stacks = format_stacks(stacks)
    instructions = format_instructions(instructions)

    Enum.reduce(instructions, stacks, &do_instruction(&1, &2, crane))
    |> Enum.sort(fn stack_1, stack_2 ->
      [stack_1_num | _] = stack_1
      [stack_2_num | _] = stack_2
      stack_1_num < stack_2_num
    end)
    |> Enum.map(&List.last/1)
    |> Enum.join()
  end

  defp do_instruction({count, from, to}, stacks, crane) do
    from_stack = Enum.find(stacks, fn [stack_number | _] -> stack_number == from end)
    to_stack = Enum.find(stacks, fn [stack_number | _] -> stack_number == to end)
    rest_stacks = Enum.filter(stacks, fn [stack_number | _] -> stack_number not in [from, to] end)

    {new_from_stack, new_to_stack} = move_crates(count, from_stack, to_stack, crane)

    [new_from_stack, new_to_stack | rest_stacks]
  end

  defp move_crates(count, from_stack, to_stack, 9000 = _crane) do
    Enum.reduce(1..count, {from_stack, to_stack}, fn _, {from_stack, to_stack} ->
      [from_stack_item | new_from_stack] = from_stack |> Enum.reverse()
      new_from_stack = new_from_stack |> Enum.reverse()
      new_to_stack = [from_stack_item | to_stack |> Enum.reverse()] |> Enum.reverse()

      {new_from_stack, new_to_stack}
    end)
  end

  defp move_crates(count, from_stack, to_stack, 9001 = _crane) do
    {new_from_stack, from_stack_items} = from_stack |> Enum.split(-count)
    new_to_stack = [from_stack_items |> Enum.reverse() | to_stack |> Enum.reverse()] |> List.flatten()

    {new_from_stack, new_to_stack |> Enum.reverse()}
  end

  defp format_stacks(stacks) do
    stacks
    |> String.replace("[", " ")
    |> String.replace("]", " ")
    |> String.split("\n")
    |> pad_to_longest_length()
    |> Enum.map(&String.graphemes/1)
    |> Enum.zip()
    |> Enum.reject(fn stack_tuple -> stack_tuple |> Tuple.to_list() |> Enum.all?(&(&1 == " ")) end)
    |> Enum.map(fn stack_tuple ->
      stack_tuple
      |> Tuple.to_list()
      |> Enum.reverse()
      |> Enum.reject(&(&1 == " "))
    end)
  end

  defp pad_to_longest_length(lines) do
    longest_len = Enum.max_by(lines, &String.length/1) |> String.length()

    Enum.map(lines, fn line ->
      line_len = String.length(line)

      if line_len < longest_len do
        length_diff = longest_len - line_len
        String.pad_trailing(line, length_diff + line_len)
      else
        line
      end
    end)
  end

  defp format_instructions(instructions) do
    instructions
    |> String.replace("move ", "")
    |> String.replace("from", "")
    |> String.replace("to", "")
    |> String.split("\n")
    |> Enum.drop(-1)
    |> Enum.map(&String.split(&1, "  "))
    |> Enum.map(fn [count, from, to] -> [String.to_integer(count), from, to] end)
    |> Enum.map(&List.to_tuple/1)
  end
end
