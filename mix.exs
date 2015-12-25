defmodule Dealer.Mixfile do
  use Mix.Project

  def project do
    [app: :dealer,
     version: "0.7.2",
     description: "An API Client for Stockfighter.",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:logger, :httpoison, :socket]]
  end

  defp deps do
    [
      {:socket, github: "larrylv/elixir-socket"},
      {:httpoison, "~> 0.8"},
      {:poison, "~> 1.5"},
      {:inch_ex, ">= 0.0.0", only: :docs},
      {:earmark, "~> 0.1", only: :docs},
      {:ex_doc, "~> 0.11", only: :docs}
    ]
  end

  defp package do
    [
      maintainers: ["Larry Lv"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/larrylv/dealer",
        "Docs" => "https://github.com/larrylv/dealer"}
    ]
  end
end
