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
iex(2)> Dealer.Heartbeat.get
%Dealer.Response{data: %Dealer.Heartbeat{error: "", ok: true},
 raw_response: %HTTPoison.Response{body: "{\"ok\":true,\"error\":\"\"}",
  headers: [{"Server", "nginx/1.8.0"},
   {"Date", "Mon, 14 Dec 2015 17:25:10 GMT"},
   {"Content-Type", "application/json"}, {"Content-Length", "22"},
   {"Connection", "keep-alive"},
   {"Strict-Transport-Security", "max-age=31536000; includeSubdomains"}],
  status_code: 200}, status_code: 200}
```
