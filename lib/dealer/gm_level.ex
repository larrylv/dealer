defmodule Dealer.GmLevel do
  @moduledoc """
  Gm level struct.
  """

  @start_endpoint "/gm/levels/:level"

  @type t :: %__MODULE__ {
    ok: boolean,
    instanceId: integer,
    account: String.t,
    tickers: [String.t],
    venues: [String.t]
  }

  defstruct ok: false,
            instanceId: 0,
            account: "",
            tickers: [],
            venues: []
end

