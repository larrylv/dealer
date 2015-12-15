defmodule Dealer.Quote do
  @moduledoc """
  Struct of quote for a stock.
  """

  @type t :: %__MODULE__ {
    ok: boolean,
    symbol: String.t,
    venue: String.t,
    bid: integer,
    ask: integer,
    bidSize: integer,
    askSize: integer,
    bidDepth: integer,
    askDepth: integer,
    last: integer,
    lastSize: integer,
    lastTrade: String.t,
    quoteTime: String.t
  }

  defstruct ok: false,
            symbol: "",
            venue: "",
            bid: 0,
            ask: 0,
            bidSize: 0,
            askSize: 0,
            bidDepth: 0,
            askDepth: 0,
            last: 0,
            lastSize: 0,
            lastTrade: "",
            quoteTime: ""
end

