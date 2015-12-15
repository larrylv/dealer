# Dealer

An api library for [Stockfighter](https://www.stockfighter.io/) in Elixir, providing functions to interact with the Stock as well as the GM apis.

[![Build Status](https://img.shields.io/travis/larrylv/dealer.svg)](https://travis-ci.org/larrylv/dealer)
[![Hex.pm Version](https://img.shields.io/hexpm/v/dealer.svg?style=flat-square)](https://hex.pm/packages/dealer)
[![Docs](https://inch-ci.org/github/larrylv/dealer.svg?branch=master&style=flat-square)](https://inch-ci.org/github/larrylv/dealer)
[![Hex.pm Downloads](https://img.shields.io/hexpm/dt/dealer.svg?style=flat-square)](https://hex.pm/packages/dealer)

## Installation

  1. Add dealer to your list of dependencies in `mix.exs`:

        def deps do
          [{:dealer, "~> 0.0.1"}]
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

## API Documentation

### Check The Api Is Up

Documentation link: https://starfighter.readme.io/docs/heartbeat

``` elixir
iex> Dealer.Heartbeat.get
%Dealer.Response{data: %Dealer.Heartbeat{error: "", ok: true},
 raw_response: %HTTPoison.Response{body: "{\"ok\":true,\"error\":\"\"}",
  headers: [{"Server", "nginx/1.8.0"},
   {"Date", "Mon, 14 Dec 2015 17:25:10 GMT"},
   {"Content-Type", "application/json"}, {"Content-Length", "22"},
   {"Connection", "keep-alive"},
   {"Strict-Transport-Security", "max-age=31536000; includeSubdomains"}],
  status_code: 200}, status_code: 200}
```

### Check The Venue Is Up

Documentation link: https://starfighter.readme.io/docs/venue-healthcheck

``` elixir
iex> Dealer.Venue.heartbeat("RQOVEX")
%Dealer.Response{data: %Dealer.Venue{error: "", ok: true, venue: "RQOVEX"},
 raw_response: %HTTPoison.Response{body: "{\n  \"ok\": true,\n  \"venue\": \"RQOVEX\"\n}",
  headers: [{"Server", "nginx/1.8.0"},
   {"Date", "Tue, 15 Dec 2015 10:27:19 GMT"},
   {"Content-Type", "application/json"}, {"Content-Length", "37"},
   {"Connection", "keep-alive"},
   {"Strict-Transport-Security", "max-age=31536000; includeSubdomains"}],
  status_code: 200}, status_code: 200}
```

### Stocks on a Venue

Documentation link: https://starfighter.readme.io/docs/list-stocks-on-venue

``` elixir
iex> Dealer.Stocks.on_venue("RQOVEX")
%Dealer.Response{data: %Dealer.Stocks{ok: true,
  symbols: [%{"name" => "DIUW Ltd.", "symbol" => "DIUW"}]},
 raw_response: %HTTPoison.Response{body: "{\n  \"ok\": true,\n  \"symbols\": [\n    {\n      \"name\": \"DIUW Ltd.\",\n      \"symbol\": \"DIUW\"\n    }\n  ]\n}",
  headers: [{"Server", "nginx/1.8.0"},
   {"Date", "Tue, 15 Dec 2015 10:54:03 GMT"},
   {"Content-Type", "application/json"}, {"Content-Length", "98"},
   {"Connection", "keep-alive"},
   {"Strict-Transport-Security", "max-age=31536000; includeSubdomains"}],
  status_code: 200}, status_code: 200}
```

### The Orderbook For A Stock

Documentation link: https://starfighter.readme.io/docs/get-orderbook-for-stock

``` elixir
iex> Dealer.Stock.orderbook("RQOVEX", "DIUW")
%Dealer.Response{data: %Dealer.Stock{asks: [%{"isBuy" => false, "price" => 6127,
     "qty" => 11570}, %{"isBuy" => false, "price" => 6157, "qty" => 11570},
   %{"isBuy" => false, "price" => 6187, "qty" => 11570}], bids: nil, ok: true,
  symbol: "DIUW", ts: "2015-12-15T11:04:20.310105107Z", venue: "RQOVEX"},
 raw_response: %HTTPoison.Response{body: "{\n  \"ok\": true,\n  \"venue\": \"RQOVEX\",\n  \"symbol\": \"DIUW\",\n  \"ts\": \"2015-12-15T11:04:20.310105107Z\",\n  \"bids\": null,\n  \"asks\": [\n    {\n      \"price\": 6127,\n      \"qty\": 11570,\n      \"isBuy\": false\n    },\n    {\n      \"price\": 6157,\n      \"qty\": 11570,\n      \"isBuy\": false\n    },\n    {\n      \"price\": 6187,\n      \"qty\": 11570,\n      \"isBuy\": false\n    }\n  ]\n}",
  headers: [{"Server", "nginx/1.8.0"},
   {"Date", "Tue, 15 Dec 2015 11:04:23 GMT"},
   {"Content-Type", "application/json"}, {"Content-Length", "356"},
   {"Connection", "keep-alive"},
   {"Strict-Transport-Security", "max-age=31536000; includeSubdomains"}],
  status_code: 200}, status_code: 200}
```

