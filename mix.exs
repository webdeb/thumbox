defmodule Thumbox.MixProject do
  use Mix.Project

  @source_url "https://github.com/webdeb/thumbox"
  @version "0.1.0"

  def project do
    [
      app: :thumbox,
      name: "Thumbox",
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  defp package() do
    [
      name: "thumbox",
      description: "Thumbor URL generator helper for elixir",
      files: ["lib", "mix.exs", "README*", "LICENSE"],
      maintainers: ["Boris Kotov"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:stream_data, "~> 0.1", only: :test},
      {:jason, "~> 1.0", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      extras: [
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      formatters: ["html"]
    ]
  end

end
