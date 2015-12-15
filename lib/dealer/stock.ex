defmodule Dealer.Stock do
  @moduledoc """
  Stock related API.
  """

  @endpoint "/ob/api/venues/:venue/stocks/:stock"

  import Dealer, only: [build_path: 2]

  @spec orderbook(String.t, String.t) :: Dealer.Response | {:error, term}
  @doc "Get the orderbook for a particular stock."
  def orderbook(venue, stock) do
    build_path(@endpoint, %{venue: venue, stock: stock})
    |> Dealer.get
    |> Dealer.Response.new(%{as: Dealer.Orderbook})
  end

  @spec quote(String.t, String.t) :: Dealer.Response | {:error, term}
  @doc "Get a quick look at the most recent trade information for a stock."
  def quote(venue, stock) do
    build_path(@endpoint, %{venue: venue, stock: stock})
    |> Dealer.get
    |> Dealer.Response.new(%{as: Dealer.Quote})
  end
end
