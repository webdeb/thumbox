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
      description: "Thumbor URL generator helper for elixir",
      source_url: "https://github.com/webdeb/thumbox",
      package: package(),
      docs: [main: "Thumbox", extras: ["README.md"]]
    ]
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "thumbox",
      # These are the default files included in the package
      files: ["lib", "mix.exs", "README*", "LICENSE"],
      maintainers: ["Boris Kotov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/webdeb/thumbox"}
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
