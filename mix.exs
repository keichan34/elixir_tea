defmodule TEA.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_tea,
     version: "1.0.0",
     elixir: "~> 1.0",
     description: description,
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end

  defp description do
    """
    A TEA (Tiny Encryption Algorithm) implemented in pure Elixir.
    """
  end

  defp package do
    [files: ~w(lib README.md LICENSE mix.exs),
     contributors: ["Keitaroh Kobayashi"],
     licenses: ~w(MIT),
     links: %{"GitHub" => "https://github.com/keichan34/elixir_tea"}]
  end
end
