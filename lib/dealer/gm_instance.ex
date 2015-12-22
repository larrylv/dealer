defmodule Dealer.GmInstance do
  @moduledoc """
  APIs to dealt with gm instance.
  """

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
end

