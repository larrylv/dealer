defmodule Dealer.OrdersStatus do
  @moduledoc """
  Struct of orders status.
  """

  @type t :: %__MODULE__ {
    ok: boolean,
    venue: String.t,
    orders: Dealer.OrdersStatus.dealers
  }

  @type dealers :: [Dealer.Order]

  defstruct ok: false,
            venue: "",
            orders: []
end

