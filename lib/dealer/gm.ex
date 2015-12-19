defmodule Dealer.GM do
  @moduledoc """
  APIs to dealt with GM.
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

  import Dealer, only: [build_path: 2]

  @spec start(String.t) :: Dealer.Response | {:error, term}
  @doc "Start a gm level."
  def start(level) do
    build_path(@start_endpoint, %{level: level})
    |> Dealer.post("")
    |> Dealer.Response.new(%{as: __MODULE__})
  end
end

