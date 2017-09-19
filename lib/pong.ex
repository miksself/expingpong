defmodule Pingpong.Pong do
  def loop({:start, ping_pid}) do
    send ping_pid, {self(), "pong"}
    loop()
  end

  def loop() do
    receive do
      {sender_pid, message} ->
        IO.puts message <> " from " <> inspect sender_pid
        send(sender_pid, {self(), "pong"})
    end
    loop()
  end
end