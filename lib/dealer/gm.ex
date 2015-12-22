defmodule Dealer.GM do
  @moduledoc """
  APIs to dealt with gm.
  """

  @level_start_endpoint "/gm/levels/:level"
  @instance_get_endpoint "/gm/instances/:instance_id"
  @instance_stop_endpoint  "/gm/instances/:instance_id/stop"
  @instance_restart_endpoint  "/gm/instances/:instance_id/restart"

  import Dealer, only: [build_path: 2]

  @spec start_level(String.t) :: Dealer.Response | {:error, term}
  @doc "Start a gm level."
  def start_level(level) do
    build_path(@level_start_endpoint, %{level: level})
    |> Dealer.post("")
    |> Dealer.Response.new(%{as: Dealer.GmLevel})
  end

  @spec get_instance(integer) :: Dealer.Response | {:error, term}
  @doc "Get an instance state."
  def get_instance(instance_id) do
    build_path(@instance_get_endpoint, %{instance_id: instance_id})
    |> Dealer.get
    |> Dealer.Response.new(%{as: Dealer.GmInstance})
  end

  @spec stop_instance(integer) ::Dealer.Response | {:error, term}
  @doc "Stop a gm instance."
  def stop_instance(instance_id) do
    build_path(@instance_stop_endpoint, %{instance_id: instance_id})
    |> Dealer.post("")
    |> Dealer.Response.new
  end

  @spec restart_instance(integer) ::Dealer.Response | {:error, term}
  @doc "Restart a gm instance."
  def restart_instance(instance_id) do
    build_path(@instance_restart_endpoint, %{instance_id: instance_id})
    |> Dealer.post("")
    |> Dealer.Response.new(%{as: Dealer.GmLevel})
  end
end

