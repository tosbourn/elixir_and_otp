defmodule ChapterTwo do
  def sum([]), do: 0

  def sum([head | tail]) do
    sum(head) + sum(tail)
  end

  def sum(head), do: head
end
