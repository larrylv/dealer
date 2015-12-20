defmodule Dealer.Response do
  @moduledoc """
  Returns api request's response
  """

  @type t :: %__MODULE__{
    status_code: number,
    data: term,
    raw_response: Dealer.Response.http_poison_response
  }

  @type http_poison_response :: %{
    body: String.t,
    headers: list,
    status_code: number
  }

  defstruct data: nil, raw_response: nil, status_code: nil

  @doc false
  @spec new(map) :: __MODULE__ | {:error, term}
  def new(response) do
    new(response, %{})
  end

  @doc """
  Returns api request's response.

  It returns `Dealer.Response` struct in case of success,
  otherwise `{:error, term}`.
  """
  @spec new(map, map) :: __MODULE__ | {:error, term}
  def new({:ok, response}, options) do
    case parse_body(response, options) do
      {:ok, data} ->
        %__MODULE__{
          data: data,
          raw_response: response,
          status_code: response.status_code
        }
      {:error, error} ->
        IO.inspect response
        {:error, error}
    end
  end

  @spec new(map, map) :: {:error, term}
  def new({:error, %HTTPoison.Error{reason: reason}}, _options) do
    {:error, reason}
  end

  defp parse_body(response, options) do
    options = Map.put(options, :keys, :atoms)

    case Poison.decode(response.body, options) do
      {:ok, data} ->
        {:ok, data}
      error ->
        {:error, error}
    end
  end
end
