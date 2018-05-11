defmodule Thumbox do
  @moduledoc """
  Documentation for Thumbox.
  """

  def get_image_url(type, path) do
    {server, origin, secret, imageTypes} = get_config()
    resource = "#{imageTypes[type]}/#{origin}/#{path}"
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

  defp get_config() do
    server = Application.get_env(:thumbox, :server)
    origin = Application.get_env(:thumbox, :origin)
    secret = Application.get_env(:thumbox, :secret)
    imageTypes = Application.get_env(:thumbox, :imageTypes)

    {server, origin, secret, imageTypes}
  end
end
