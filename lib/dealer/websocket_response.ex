defmodule Dealer.Websocket.Response do
  @moduledoc """
  Returns websocket's response
  """

  @type t :: %__MODULE__{
    type: String.t,
    data: map,
    raw_response: String.t
  }

  defstruct type: "", data: %{}, raw_response: ""

  @doc false
  @spec new(map) :: __MODULE__ | {:error, term}
  def new(response) do
    new(response, %{})
  end

  @doc """
  Returns websocket's response.

  It returns `Dealer.WebsocketResponse` struct in case of success,
  otherwise `{:error, term}`.
  """
  @spec new(tuple, map) :: __MODULE__ | {:error, term}
  def new({:text, response}, options) do
    case parse_body(response, options) do
      {:ok, data} ->
        %__MODULE__{
          type: "text",
          data: data,
          raw_response: response
        }
      {:error, error} ->
        {:error, error}
    end
  end

  def new({mime_type, response}, _options) do
    {:error, "Mime type #{mime_type} not supported, response: #{response}"}
  end

  def new(response, _options) do
    {:error, response}
  end

  defp parse_body(response, options) do
    options = Map.put(options, :keys, :atoms)

    case Poison.decode(response, options) do
      {:ok, data} ->
        {:ok, data}
      error ->
        {:error, error}
    end
  end
end
