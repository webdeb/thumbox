defmodule Thumbox do
  @moduledoc """
  Documentation for Thumbox.

  ## Config

  ```
  config :thumbox,
      server: "https://thumbor.example.com",
      # or just 'app' if thumbor can access it in the network
      origin: "my-app.com:4000",
      secret: "secret",
      types: %{
        big: "300x300/smart",
        small: "50x50/smart"
      }
  ```

  """
  @doc ~S"""
    Generates an URL to the thumbor service

    Example
    ```
    iex> Thumbox.gen_url(:small, "uploads/image.jpg", server: "http://thumbor:8000", origin: "app.com", secret: "secret", types: %{ small: "100x100" })
    "http://thumbor:8000/-fACxLAC_MbZ_JHxm0-tLYrHM2Y=/100x100/app.com/uploads/image.jpg"

    ```
  """
  def gen_url(type, path, opts \\ []) do
    {server, origin, secret, types} = get_config(opts)
    resource = "#{types[type]}/#{origin}/#{path}"
    signature = sign(secret, resource)

    "#{server}/#{signature}/#{resource}"
  end

  @doc """
  Signs a string like its done by thumbor
  see: http://thumbor.readthedocs.io/en/latest/libraries.html#library-tests-scenarios
  """
  def sign(key, str) do
    :crypto.hmac(:sha, key, str)
    |> Base.url_encode64()
  end

  defp get_config(opts) do
    {
      opts[:server] || Application.get_env(:thumbox, :server),
      opts[:origin] || Application.get_env(:thumbox, :origin),
      opts[:secret] || Application.get_env(:thumbox, :secret),
      opts[:types] || Application.get_env(:thumbox, :types)
    }
  end
end
