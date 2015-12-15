defmodule Dealer.Orders do
  @moduledoc """
  Orders related API.
  """

  @orders_endpoint "/ob/api/venues/:venue/stocks/:stock/orders"
  @account_order_status_endpoint "/ob/api/venues/:venue/accounts/:account/orders"
  @stock_order_status_endpoint "/ob/api/venues/:venue/accounts/:account/stocks/:stock/orders"

  import Dealer, only: [build_path: 2]

  @spec create(String.t, String.t, map) :: Dealer.Response | {:error, term}
  @doc "Place an order for a stock"
  def create(venue, stock, order) do
    {:ok, post_body} = Poison.encode(order)

    build_path(@orders_endpoint, %{venue: venue, stock: stock})
    |> Dealer.post(post_body)
    |> Dealer.Response.new(%{as: Dealer.Order})
  end

  @spec status(String.t, String.t) :: Dealer.Response | {:error, term}
  @doc "Get status for all orders."
  def status(venue, account) do
    build_path(@account_order_status_endpoint, %{venue: venue, account: account})
    |> Dealer.get
    |> Dealer.Response.new(%{as: Dealer.OrdersStatus})
  end

  @spec status(String.t, String.t, String.t) :: Dealer.Response | {:error, term}
  @doc "Get status for all orders in a stock."
  def status(venue, account, stock) do
    build_path(@stock_order_status_endpoint, %{venue: venue, account: account, stock: stock})
    |> Dealer.get
    |> Dealer.Response.new(%{as: Dealer.OrdersStatus})
  end
end
