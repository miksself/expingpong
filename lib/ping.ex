defmodule Pingpong.Ping do
  def loop() do
    receive do
      {sender_pid, message} ->
        IO.puts message <> " from " <> inspect sender_pid
        send(sender_pid, {self(), "ping"})
    end
    loop()
  end
end