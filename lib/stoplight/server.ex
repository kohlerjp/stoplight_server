defmodule Stoplight.Server do
  use GenServer

  # Client
  def start_link(_options) do
    GenServer.start_link(__MODULE__, :ok, [name: __MODULE__])
  end

  def check_light() do
    GenServer.call(__MODULE__, :check_light)
  end

  # Server callback
  def init(:ok) do
    schedule_light_change()
    {:ok, :yellow}
  end

  def handle_call(:check_light, _sender, current_light) do
    {:reply, current_light, current_light}
  end

  def handle_info(:update_light, current_light) do
    schedule_light_change()
    {:noreply, next_light(current_light)}
  end

  def schedule_light_change() do
    Process.send_after(self(), :update_light, 1)
  end

  # light functions
  def next_light(:green), do: :yellow
  def next_light(:yellow), do: :red
  def next_light(:red), do: :green
end
