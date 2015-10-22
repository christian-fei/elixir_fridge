defmodule FridgeTest do
  use ExUnit.Case
  doctest Fridge

  test "fridge is empty" do
    {:ok, fridge} = Fridge.start_link()
    assert [] == Fridge.get_items(fridge)
  end

  test "adding an item to the fridge updates its contents" do
    {:ok, fridge} = Fridge.start_link()
    Fridge.add_item(fridge, "yogurt")
    assert ["yogurt"] == Fridge.get_items(fridge)
  end

  test "removing an items from the fridge updates its contents" do
    {:ok, fridge} = Fridge.start_link()
    Fridge.add_item(fridge, "yogurt")
    Fridge.remove_item(fridge, "yogurt")
    assert [] == Fridge.get_items(fridge)
  end
end
