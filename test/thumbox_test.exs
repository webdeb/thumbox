defmodule ThumboxTest do
  use ExUnit.Case, async: true
  doctest Thumbox
  use ExUnitProperties

  property "compare generation of thumbor and thumbox hmac of a simple string" do
    [:ascii, :alphanumeric]
    |> Enum.each(fn type ->
      check all key <- StreamData.string(type),
                str <- StreamData.string(type) do
        assert sign_in_thumbor(key, str) == Thumbox.sign(key, str)
      end
    end)
  end

  test "url generation" do
    assert Thumbox.gen_url(:big, "uploads/my.img") ==
             "https://thumbor.example.com/BoD6rpx-wqlK4WxYV_D1c1iacd4=/300x300/smart/my-app.com:4000/uploads/my.img"
  end

  # Helper function, thumbor and python must be installed locally to run
  defp sign_in_thumbor(key, str) do
    script = EEx.eval_file("test/signer.py.eex", key: key, str: str)
    {<<signature::binary-size(28), "\n">>, _} = System.cmd("python2.7", ["-c", script])

    signature
  end
end
