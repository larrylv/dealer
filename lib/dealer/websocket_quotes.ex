defmodule Dealer.Websocket.Quotes do
  @moduledoc """
  Dealing with quotes websocket.
  """

  @domain "api.stockfighter.io"

  @tickertape_path "/ob/api/ws/:trading_account/venues/:venue/tickertape"
  @tickertape_stock_path "/ob/api/ws/:trading_account/venues/:venue/tickertape/stocks/:stock"

  import Dealer, only: [build_path: 2]

  @doc "Quotes (Ticker Tape) Websocket"

  @spec connect(String.t, String.t) :: Socket.Web.t
  def connect(trading_account, venue) do
    path = build_path(@tickertape_path, %{trading_account: trading_account, venue: venue})

    Socket.Web.connect!(@domain, path: path, secure: true)
  end

  @spec connect(String.t, String.t, String.t) :: Socket.Web.t
  def connect(trading_account, venue, stock) do
    path = build_path(@tickertape_path, %{trading_account: trading_account, venue: venue, stock: stock})

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

