defmodule Dealer do
  @moduledoc """
  An api client for [Stockfighter](https://www.stockfighter.io/) in Elixir, providing functions to interact with the Stock as well as the GM apis.
  """

  use HTTPoison.Base

  @trailing_param_key_regex ~r/(.+)\/\:\w+\Z/

  @doc false
  @spec process_url(String.t) :: String.t
  def process_url(path) do
    "https://api.stockfighter.io" <> path
  end

  @doc false
  @spec process_request_headers(list) :: list
  def process_request_headers(headers) do
    headers ++ [{"X-Starfighter-Authorization", secret_key}, {"Content-Type", "application/json"}]
  end

  defp secret_key do
    System.get_env("DEALER_API_KEY") ||
    Application.get_env(:dealer, :api_key) ||
    raise "You should set `DEALER_API_KEY` environment variable, or set the application env by `Application.put_env(:dealer, :api_key, \"your_api_key\")`."
  end

  @doc """
  Build api request path based on path and parameters.
  """
  @spec build_path(String.t, map) :: String.t
  def build_path(path, params) do
    Enum.reduce(params, path, &do_param_replacement/2)
    |> remove_unused_params
  end

  defp do_param_replacement({key, value}, path) do
    if String.contains? path, ":#{key}" do
      replace_param_with_value(path, key, value)
    else
      add_query_param(path, key, value)
    end
  end

  defp replace_param_with_value(path, key, value) do
    param_regex = ~r/(\/|\a)(\:#{key})(\/|\Z)/
    Regex.replace param_regex, path, fn _, start, _, finish ->
      "#{start}#{value}#{finish}"
    end
  end

  defp add_query_param(path, key, value) do
    query_param = URI.encode_query(Map.put %{}, key, value)
    if String.contains? path, "?" do
      "#{path}&#{query_param}"
    else
      "#{path}?#{query_param}"
    end
  end

  defp remove_unused_params(path) do
    if Regex.match? @trailing_param_key_regex, path do
      Regex.replace @trailing_param_key_regex, path, "\\1"
    else
      path
    end
  end

end
