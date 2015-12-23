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
    socket
    |> Socket.Web.recv!
    |> Dealer.Websocket.Response.new
  end
end
