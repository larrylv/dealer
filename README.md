# Dealer

An api client for Stockfighter in Elixir.

[![Build Status](https://img.shields.io/travis/larrylv/dealer.svg)](https://travis-ci.org/larrylv/dealer)
[![Hex.pm Version](https://img.shields.io/hexpm/v/dealer.svg?style=flat-square)](https://hex.pm/packages/dealer)
[![Docs](https://inch-ci.org/github/larrylv/dealer.svg?branch=master&style=flat-square)](https://inch-ci.org/github/larrylv/dealer)
[![Hex.pm Downloads](https://img.shields.io/hexpm/dt/dealer.svg?style=flat-square)](https://hex.pm/packages/dealer)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add dealer to your list of dependencies in `mix.exs`:

        def deps do
          [{:dealer, "~> 0.0.1"}]
        end

  2. Ensure dealer is started before your application:

        def application do
          [applications: [:dealer]]
        end
