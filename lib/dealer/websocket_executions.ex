defmodule Dealer.Websocket.Executions do
  @moduledoc """
  Dealing with executions websocket.
  """

  @domain "api.stockfighter.io"

  @executions_path "/ob/api/ws/:trading_account/venues/:venue/executions"
  @executions_stock_path "/ob/api/ws/:trading_account/venues/:venue/executions/stocks/:stock"

  import Dealer, only: [build_path: 2]

  @doc "Executions (Fills) Websocket"

  @spec connect!(String.t, String.t) :: Socket.Web.t
  def connect!(trading_account, venue) do
    path = build_path(@executions_path, %{trading_account: trading_account, venue: venue})

    Socket.Web.connect!(@domain, path: path, secure: true)
  end

  @spec connect!(String.t, String.t, String.t) :: Socket.Web.t
  def connect!(trading_account, venue, stock) do
    path = build_path(@executions_stock_path, %{trading_account: trading_account, venue: venue, stock: stock})

    Socket.Web.connect!(@domain, path: path, secure: true)
  end

  @doc "Close the websocket"
  @spec close(Socket.Web.t) :: atom
  def close(socket) do
    Dealer.Websocket.close(socket)
  end

  @doc "Receive message from websocket"
  @spec recv!(Socket.Web.t) :: Dealer.Websocket.Response
  def recv!(socket) do
    Dealer.Websocket.recv!(socket)
  end
end

