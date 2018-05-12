defmodule Thumbox do
  @moduledoc """
  Documentation for Thumbox.

  configure
  """

  def get_image_url(type, path, opts \\ []) do
    {server, origin, secret, types} = get_config(opts)
    resource = "#{types[type]}/#{origin}/#{path}"
    signature = sign(secret, resource)

    "#{server}/#{signature}/#{resource}"
  end

  @doc """
  Signs a string like its done by thumbor
  See: http://thumbor.readthedocs.io/en/latest/libraries.html#library-tests-scenarios
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
