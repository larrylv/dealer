defmodule Dealer.Stock.Order do
  @moduledoc """
  Struct of an orderbook for a stock.
  """

  @type t :: %__MODULE__ {
    ok: boolean,
    symbol: String.t,
    venue: String.t,
    direction: String.t,
    originalQty: integer,
    qty: integer,
    price: integer,
    type: String.t,
    id: String.t,
    account: String.t,
    ts: String.t,
    fills: Dealer.Order.fills
  }

  @type fills :: [%{ price: integer, qty: integer, ts: String.t }]

  defstruct ok: false,
            symbol: "",
            venue: "",
            direction: "",
            originalQty: 0,
            qty: 0,
            price: 0,
            type: "",
            id: "",
            account: "",
            ts: "",
            fills: []
end

