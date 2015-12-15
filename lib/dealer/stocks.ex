defmodule Dealer.Stocks do
  @moduledoc """
  Stocks related API.
  """

  @stock_list_endpoint "/ob/api/venues/:venue/stocks"
  @stock_show_endpoint "/ob/api/venues/:venue/stocks/:stock"

  @type t :: %__MODULE__ {
    ok: boolean,
    symbols: Dealer.Stocks.symbols
  }

  @type symbols :: [%{
      name: String.t,
      symbol: String.t
    }]

  defstruct ok: false, symbols: []

  import Dealer, only: [build_path: 2]

  @spec on_venue(String.t) :: Dealer.Response | {:error, term}
  @doc "List the stocks available for trading on a venue"
  def on_venue(venue) do
    build_path(@stock_list_endpoint, %{venue: venue})
    |> Dealer.get
    |> Dealer.Response.new(%{as: __MODULE__})
  end
end
