defmodule Clocks.CurrentTimeChannel do
  use Phoenix.Channel
  use Timex
  require Logger

  def join("currenttime:" <> tz, _message, socket) do
    :timer.send_interval(1000, {:currenttime, tz})
    {:ok, socket}
  end

  def handle_info({:currenttime, tz}, socket) do
    date = Date.local
    |> Timezone.convert(Timezone.get(tz))
    %{:hour => hour, :minute => minute, :second => second} = date

    push socket, "time:update", %{hours: hour, mins: minute, secs: second, tz: tz}
    {:noreply, socket}
  end

  def terminate(reason, socket) do
    Logger.debug"> leave #{inspect reason}"
    :ok
  end
end
