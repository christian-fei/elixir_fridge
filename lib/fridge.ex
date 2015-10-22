defmodule Fridge do
  use GenServer

  # public api
  def start_link(contents \\ []) do
    :gen_server.start_link({:local, :fridge}, __MODULE__, contents, [])
  end

  def get_items(fridge \\ :fridge) do
    :gen_server.call(fridge, :get_items)
  end

  def add_item(fridge \\ :fridge, item) do
    :gen_server.call(fridge, {:add_item, item})
  end

  def remove_item(fridge \\ :fridge, item) do
    :gen_server.call(fridge, {:remove_item, item})
  end

  def crash(fridge \\ :fridge) do
    :gen_server.cast fridge, :crash
  end


  # gen_server api
  def init(contents) do
    {:ok, contents}
  end

  def handle_call(:get_items, _from, contents) do
    {:reply, contents, contents}
  end
  def handle_call({:add_item, item}, _from, contents) do
    contents = [item|contents]
    {:reply, contents, contents}
  end
  def handle_call({:remove_item, item}, _from, contents) do
    contents = List.delete(contents, item)
    {:reply, contents, contents}
  end

  def handle_cast(:crash, _from, contents) do
    1 = 2
  end
end
