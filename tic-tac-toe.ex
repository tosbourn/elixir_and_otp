defmodule TTT do
  def check_board(board) do
    case board do
      { :x, :x, :x,
        _, _, _,
        _, _, _ } -> :x_win
      { _, _, _,
       :x, :x, :x,
        _, _, _ } -> :x_win
      { _, _, _,
        _, _, _,
        :x, :x, :x } -> :x_win
      { :x, _, _,
        :x, _, _,
        :x, _, _ } -> :x_win
      { _, :x, _,
        _, :x, _,
        _, :x, _ } -> :x_win
      { _, _, :x,
        _, _, :x,
        _, _, :x } -> :x_win
      { :x, _, _,
        _, :x, _,
        _, _, :x } -> :x_win
      { _, _, :x,
        _, :x, _,
        :x, _, _ } -> :x_win
      { :o, :o, :o,
        _, _, _,
        _, _, _ } -> :o_win
      { _, _, _,
       :o, :o, :o,
        _, _, _ } -> :o_win
      { _, _, _,
        _, _, _,
        :o, :o, :o } -> :o_win
      { :o, _, _,
        :o, _, _,
        :o, _, _ } -> :o_win
      { _, :o, _,
        _, :o, _,
        _, :o, _ } -> :o_win
      { _, _, :o,
        _, _, :o,
        _, _, :o } -> :o_win
      { :o, _, _,
        _, :o, _,
        _, _, :o } -> :o_win
      { _, _, :o,
        _, :o, _,
        :o, _, _ } -> :o_win
      { a, b, c,
        d, e, f,
        g, h, i } when a and b and c and d and e and f and g and h and i -> :draw
      _ -> :in_progress
    end
  end
end
