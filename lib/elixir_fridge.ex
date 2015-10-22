defmodule Fridge do
  use GenServer
  # public api
  def start_link(contents) do
    :gen_server.start_link(__MODULE__, contents, [])
  end

  def get_items(fridge) do
    :gen_server.call(fridge, :get_items)
  end

  # gen_server api
  def init(contents) do
    {:ok, contents}
  end
  def handle_call(:get_items, _from, contents) do
    {:reply, contents, contents}
  end
end
