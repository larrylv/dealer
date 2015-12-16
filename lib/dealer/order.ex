defmodule Dealer.Order do
  @moduledoc """
  Struct of an orderbook for a stock.
  """

  @endpoint "/ob/api/venues/:venue/stocks/:stock/orders/:id"

  @type t :: %__MODULE__ {
    ok: boolean,
    symbol: String.t,
    venue: String.t,
    direction: String.t,
    originalQty: integer,
    qty: integer,
    price: integer,
    orderType: String.t,
    id: integer,
    account: String.t,
    ts: String.t,
    fills: Dealer.Order.fills,
    totalFilled: integer,
    open: boolean
  }

  @type fills :: [%{ price: integer, qty: integer, ts: String.t }]

  defstruct ok: false,
            symbol: "",
            venue: "",
            direction: "",
            originalQty: 0,
            qty: 0,
            price: 0,
            orderType: "",
            id: 0,
            account: "",
            ts: "",
            fills: [],
            totalFilled: 0,
            open: false

  import Dealer, only: [build_path: 2]

  @spec status(String.t, String.t, integer) :: Dealer.Response | {:error, term}
  @doc "Status for an existing order."
  def status(venue, stock, id) do
    build_path(@endpoint, %{venue: venue, stock: stock, id: id})
    |> Dealer.get
    |> Dealer.Response.new(%{as: __MODULE__})
  end

  @spec cancel(String.t, String.t, integer) :: Dealer.Response | {:error, term}
  @doc "Cancel An Order."
  def cancel(venue, stock, id) do
    build_path(@endpoint, %{venue: venue, stock: stock, id: id})
    |> Dealer.delete
    |> Dealer.Response.new(%{as: __MODULE__})
  end

end

