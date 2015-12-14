defmodule Dealer do
  @moduledoc """
  An api client for [Stockfighter](https://www.stockfighter.io/) in Elixir, providing functions to interact with the Stock as well as the GM apis.
  """

  use HTTPoison.Base

  @spec process_url(String.t) :: String.t
  def process_url(path) do
    "https://api.stockfighter.io" <> path
  end

  @spec process_request_headers(array) :: array
  def process_request_headers(headers) do
    headers ++ [{"X-Starfighter-Authorization", secret_key}, {"Content-Type", "application/json"}]
  end

  defp secret_key do
    System.get_env("DEALER_API_KEY") ||
     Application.get_env(:dealer, :api_key) ||
     raise "You should set `DEALER_API_KEY` environment variable, or set the application env by `Application.put_env(:dealer, :api_key, \"xxx\")`."
  end
end
