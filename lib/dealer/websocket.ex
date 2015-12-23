defmodule Dealer.Websocket do
  @moduledoc false

  @doc "Close the websocket"
  @spec close(Socket.Web.t) :: atom
  def close(socket) do
    Socket.Web.close(socket)
  end

  @doc "Receive message from websocket"
  @spec recv!(Socket.Web.t) :: Dealer.Websocket.Response
  def recv!(socket) do
    case Socket.Web.recv!(socket) do
      {:ping, _} = packet->
        IO.inspect packet
        Socket.Web.send(socket, {:pong, "pong"}, [])
      {:text, _} = response ->
        Dealer.Websocket.Response.new(response)
    end
  end
end
