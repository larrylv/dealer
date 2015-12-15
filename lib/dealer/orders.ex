defmodule Dealer.Orders do
  @moduledoc """
  Orders related API.
  """

  @endpoint "/ob/api/venues/:venue/stocks/:stock/orders"

  import Dealer, only: [build_path: 2]

  @spec create(String.t, String.t, map) :: Dealer.Response | {:error, term}
  @doc "Place an order for a stock"
  def create(venue, stock, order) do
    {:ok, post_body} = Poison.encode(order)

    build_path(@endpoint, %{venue: venue, stock: stock})
    |> Dealer.post(post_body)
    |> Dealer.Response.new(%{as: Dealer.Stock.Order})
  end
end
