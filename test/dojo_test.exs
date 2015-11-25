defmodule DojoTest do
  use ExUnit.Case
  doctest Dojo

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "check string" do
    assert "1234567890" == Dojo.decode("")
  end

end
