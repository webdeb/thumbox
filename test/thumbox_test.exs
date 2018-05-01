defmodule ThumboxTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  property "compare generation of thumbor and thumbox hmac of a simple string" do
    check all key <- StreamData.string(:alphanumeric),
              str <- StreamData.string(:alphanumeric) do
      assert sign_in_thumbor(key, str) == Thumbox.sign(key, str)
    end
  end

  # Helper function, thumbor must be installed locally to run
  defp sign_in_thumbor(key, str) do
    script = EEx.eval_file("test/signer.py.eex", key: key, str: str)
    {<<signature::binary-size(28), "\n">>, _} = System.cmd("python2.7", ["-c", script])

    signature
  end
end
