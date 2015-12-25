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
      {:ping, packet} ->
        Socket.Web.pong!(socket, packet)
        recv!(socket)
      {:text, _} = packet ->
        Dealer.Websocket.Response.new(packet)
      packet ->
        raise "Unknown packet: #{inspect(packet)}"
    end
  end
end
