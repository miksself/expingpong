defmodule Pingpong do
  def start do
    :observer.start
    ping_pid = spawn(Pingpong.Ping, :loop, [])
    spawn(Pingpong.Pong, :loop, [{:start, ping_pid}])
  end
end
