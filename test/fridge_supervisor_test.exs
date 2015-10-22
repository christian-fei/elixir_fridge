defmodule Fridge.SupervisorTest do
  use ExUnit.Case

  test "restarts fridge with empty contents" do
    {:ok, fridge_sup} = Fridge.Supervisor.start_link()
  end
end
