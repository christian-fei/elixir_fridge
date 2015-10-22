defmodule Fridge.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(state) do
    children = [
      worker(Fridge, state)
    ]
    supervise(children, strategy: :one_for_one)
  end
end
