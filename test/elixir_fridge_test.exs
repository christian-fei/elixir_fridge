defmodule FridgeTest do
  use ExUnit.Case
  doctest Fridge

  test "fridge is empty" do
    {:ok, fridge} = Fridge.start_link()
    assert [] == Fridge.get_items(fridge)
  end
end
