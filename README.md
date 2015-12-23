# Dealer

An api library for [Stockfighter](https://www.stockfighter.io/) in Elixir, providing functions to interact with the Stock as well as the GM apis.

[![Build Status](https://img.shields.io/travis/larrylv/dealer.svg)](https://travis-ci.org/larrylv/dealer)
[![Hex.pm Version](https://img.shields.io/hexpm/v/dealer.svg?style=flat-square)](https://hex.pm/packages/dealer)
[![Docs](https://inch-ci.org/github/larrylv/dealer.svg?branch=master&style=flat-square)](https://inch-ci.org/github/larrylv/dealer)
[![Hex.pm Downloads](https://img.shields.io/hexpm/dt/dealer.svg?style=flat-square)](https://hex.pm/packages/dealer)

## Installation

  1. Add dealer to your list of dependencies in `mix.exs`:

        def deps do
          [{:dealer, "~> 0.6.1"}]
        end

  2. Ensure dealer is started before your application:

        def application do
          [applications: [:dealer]]
        end

## Usage

### Start application

If you havn't specified starting `dealer` application in your mix.exs, or you are in a normal `iex` session, you should explicitly call `Dealer.start` to start the application.

### Authentication

You should set `DEALER_API_KEY` environment variable, or set the application env by `Application.put_env(:dealer, :api_key, "your_api_key")`.

### Response

If the api request is successful, the response will be a `Dealer.Response` struct, which is a struct defined containing three fields:

* data: decoded json response
* status_code: the request's status code
* raw_response: original response

Or something bad might happen during the reuqest, the response will be: `{:error, term}`.

Websocket response will be either a `Dealer.Websocket.Response` struct or `{:error, term}`.

## API Documentation

### Check The Api Is Up

Documentation link: https://starfighter.readme.io/docs/heartbeat

``` elixir
iex> Dealer.Heartbeat.get
```

### Check The Venue Is Up

Documentation link: https://starfighter.readme.io/docs/venue-healthcheck

``` elixir
iex> Dealer.Venue.heartbeat("RQOVEX")
```

### Stocks on a Venue

Documentation link: https://starfighter.readme.io/docs/list-stocks-on-venue

``` elixir
iex> Dealer.Stocks.on_venue("RQOVEX")
```

### The Orderbook For A Stock

Documentation link: https://starfighter.readme.io/docs/get-orderbook-for-stock

``` elixir
iex> Dealer.Stock.orderbook("RQOVEX", "DIUW")
```

### A New Order For A Stock

Documentation link: https://starfighter.readme.io/docs/place-new-order

``` elixir
iex> Dealer.Orders.create("QWYIEX", "YPII", %{account: "TOB1728377", price: 33, qty: 100, direction: "buy", orderType: "limit"})
```

### A Quote For A Stock

Documentation link: https://starfighter.readme.io/docs/a-quote-for-a-stock

``` elixir
iex> Dealer.Stock.quote("LBPTEX", "GVOE")
```

### Status For An Existing Order

Documentaion link: https://starfighter.readme.io/docs/status-for-an-existing-order

``` elixir
iex> Dealer.Order.status("LBPTEX", "GVOE", 306)
```

### Cancel An Order

Documentation link: https://starfighter.readme.io/docs/cancel-an-order

``` elixir
iex> Dealer.Order.cancel("LBPTEX", "GVOE", 306)

```

### Status For All Orders

Documentation link: https://starfighter.readme.io/docs/status-for-all-orders

``` elixir
iex> Dealer.Orders.status("LBPTEX", "ACCOUNT_NAME")
```

### Status For All Orders In A Stock

Documentation link: https://starfighter.readme.io/docs/status-for-all-orders-in-a-stock

``` elixir
iex> Dealer.Orders.status("LBPTEX", "ACCOUNT_NAME", "GVOE")
```

## Websocket Documentation

### Quotes (Ticket Tape)

Documentation link: https://starfighter.readme.io/docs/quotes-ticker-tape-websocket

``` elixir
iex> {account, venue, stock} = {"MSB5372858", "TYAMEX", "PTC"}
iex> socket = Dealer.Websocket.Quotes.connect!(account, venue)
iex> Dealer.Websocket.Quotes.recv!(socket)
iex> Dealer.Websocket.Quotes.close(socket)

iex> socket = Dealer.Websocket.Quotes.connect!(account, venue, stock)
iex> Dealer.Websocket.Quotes.recv!(socket)
iex> Dealer.Websocket.Quotes.close(socket)
```

### Executions (Fills)

Documentation link: https://starfighter.readme.io/docs/executions-fills-websocket

``` elixir
iex> {account, venue, stock} = {"MSB5372858", "TYAMEX", "PTC"}
iex> socket = Dealer.Websocket.Executions.connect!(account, venue)
iex> Dealer.Websocket.Executions.recv!(socket)
iex> Dealer.Websocket.Executions.close(socket)

iex> socket = Dealer.Websocket.Executions.connect!(account, venue, stock)
iex> Dealer.Websocket.Executions.recv!(socket)
iex> Dealer.Websocket.Executions.close(socket)
```

## GM Documentation

### Start a level

``` elixir
iex> Dealer.GM.start_level("dueling_bulldozers")
```

### Get an instance state

``` elixir
iex> Dealer.GM.get_instance(5360)
```

### Stop an instance

``` elixir
iex> Dealer.GM.stop_instance(5360)
```

### Restart an instance

``` elixir
iex> Dealer.GM.restart_instance(5360)
```

