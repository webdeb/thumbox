defmodule Thumbox.MixProject do
  use Mix.Project

  def project do
    [
      app: :thumbox,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Thumbox",
      source_url: "https://github.com/webdeb/thumbox",
      # The main page in the docs
      docs: [main: "Thumbox", extras: ["README.md"]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:stream_data, "~> 0.1", only: :test},
      {:jason, "~> 1.0", only: :test},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
    ]
  end
end
