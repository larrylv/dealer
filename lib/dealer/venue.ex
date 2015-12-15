defmodule Dealer.Venue do
  @moduledoc """
  Venues related API.
  """

  @endpoint "/ob/api/venues/:venue/heartbeat"

  @type t :: %__MODULE__ {
    ok: boolean,
    venue: String.t,
    error: String.t
  }

  import Dealer, only: [build_path: 2]

  defstruct ok: false, venue: "", error: ""

  @spec heartbeat(String.t) :: Dealer.Response | {:error, term}
  @doc "Check the venue is up"
  def heartbeat(venue) do
    build_path(@endpoint, %{venue: venue})
    |> Dealer.get
    |> Dealer.Response.new(%{as: __MODULE__})
  end
end
