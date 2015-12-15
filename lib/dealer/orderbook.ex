defmodule Dealer.Orderbook do
  @moduledoc """
  Struct of an orderbook for a stock.
  """

  @type t :: %__MODULE__ {
    ok: boolean,
    venue: String.t,
    symbol: String.t,
    bids: Dealer.Orderbook.bids,
    asks: Dealer.Orderbook.asks,
    ts: String.t
  }

  @type bids :: [%{ price: integer, qty: integer, isBuy: boolean }]
  @type asks :: [%{ price: integer, qty: integer, isBuy: boolean }]

  defstruct ok: false,
            venue: "",
            symbol: "",
            bids: [],
            asks: [],
            ts: ""
end

