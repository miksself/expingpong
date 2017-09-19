defmodule Pingpong.Pong do
  def loop() do
    receive do
      {sender_pid, message} ->
        IO.puts message <> " from " <> inspect sender_pid
        send(sender_pid, {self(), "pong"})
    end
    loop()
  end
end