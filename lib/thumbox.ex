defmodule Thumbox do
  @moduledoc """
  Documentation for Thumbox.
  """

  @doc """
  Signs a string like its done by thumbor
  See: http://thumbor.readthedocs.io/en/latest/libraries.html#library-tests-scenarios

  """
  def sign(key, str) do
    :crypto.hmac(:sha, key, str)
    |> Base.url_encode64()
  end
end
