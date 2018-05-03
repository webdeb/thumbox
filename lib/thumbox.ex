defmodule Thumbox do
  @moduledoc """
  Documentation for Thumbox.
  """

  def get_image_url(type, url) do
    [
      server: server,
      secret: secret,
      imageTypes: imageTypes
    ] = Application.get_all_env(:thumbox)

    resource = imageTypes[type] <> url
    server <> sign(secret, resource) <> "/" <> resource
  end

  @doc """
  Signs a string like its done by thumbor
  See: http://thumbor.readthedocs.io/en/latest/libraries.html#library-tests-scenarios
  """
  def sign(key, str) do
    :crypto.hmac(:sha, key, str)
    |> Base.url_encode64()
  end
end
