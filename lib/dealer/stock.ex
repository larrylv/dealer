defmodule Dealer.Stock do
  @moduledoc """
  Stock related API.
  """

  @endpoint "/ob/api/venues/:venue/stocks/:stock"

  @type t :: %__MODULE__ {
    ok: boolean,
    venue: String.t,
    symbol: String.t,
    bids: Dealer.Stock.bids,
    asks: Dealer.Stock.asks,
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

  import Dealer, only: [build_path: 2]

  @spec orderbook(String.t, String.t) :: Dealer.Response | {:error, term}
  @doc "Get the orderbook for a particular stock"
  def orderbook(venue, stock) do
    build_path(@endpoint, %{venue: venue, stock: stock})
    |> Dealer.get
    |> Dealer.Response.new(%{as: __MODULE__})
  end
end
