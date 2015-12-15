defmodule Dealer.Stock do
  @moduledoc """
  Stock related API.
  """

  @endpoint "/ob/api/venues/:venue/stocks/:stock"

  import Dealer, only: [build_path: 2]

  @spec orderbook(String.t, String.t) :: Dealer.Response | {:error, term}
  @doc "Get the orderbook for a particular stock"
  def orderbook(venue, stock) do
    build_path(@endpoint, %{venue: venue, stock: stock})
    |> Dealer.get
    |> Dealer.Response.new(%{as: Dealer.Stock.Orderbook})
  end
end
