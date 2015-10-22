defmodule Fridge do
  use GenServer
  def start_link(contents) do
    :gen_server.start_link(__MODULE__, contents, [])
  end

  def init(contents) do
    {:ok, contents}
  end
end
