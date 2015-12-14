defmodule Dealer.Heartbeat do
  @moduledoc """
  Check the api is up
  """

  @endpoint "/ob/api/heartbeat"

  @type t :: %__MODULE__ {
    ok: boolean,
    error: String.t
  }

  defstruct ok: false, error: ""

  @spec get() :: Dealer.Response | {:error, term}
  @doc "Check the api is up"
  def get do
    build_path(@endpoint)
    |> Dealer.get
    |> Dealer.Response.new(%{as: __MODULE__})
  end

  defp build_path(path) do
    path
  end
end
