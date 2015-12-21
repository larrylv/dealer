defmodule Dealer.GmInstance do
  @moduledoc """
  APIs to dealt with gm instance.
  """

  @start_endpoint "/gm/instances/:instance_id"

  @type t :: %__MODULE__ {
    ok: boolean,
    done: boolean,
    id: integer,
    state: String.t,
    details: Map.t
  }

  defstruct ok: false,
            done: false,
            id: 0,
            state: "",
            details: %{}

  import Dealer, only: [build_path: 2]

  @spec get(integer) :: Dealer.Response | {:error, term}
  @doc "Get an instance state."
  def get(instance_id) do
    build_path(@start_endpoint, %{instance_id: instance_id})
    |> Dealer.get
    |> Dealer.Response.new(%{as: __MODULE__})
  end
end

