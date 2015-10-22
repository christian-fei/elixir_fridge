defmodule FridgeTest do
  use ExUnit.Case
  doctest Fridge

  setup do
    {:ok, fridge} = Fridge.start_link()
    {:ok, fridge: fridge}
  end

  test "fridge is empty", %{fridge: fridge} do
    assert [] == Fridge.get_items(fridge)
  end

  test "adding an item to the fridge updates its contents", %{fridge: fridge} do
    Fridge.add_item(fridge, "yogurt")
    assert ["yogurt"] == Fridge.get_items(fridge)
  end

  test "removing an items from the fridge updates its contents", %{fridge: fridge} do
    Fridge.add_item(fridge, "yogurt")
    Fridge.remove_item(fridge, "yogurt")
    assert [] == Fridge.get_items(fridge)
  end
end
