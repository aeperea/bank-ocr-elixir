defmodule DojoTest do
  use ExUnit.Case
  doctest Dojo

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "check for first entry" do
    assert "123456789" == Dojo.decode("./lib/entry.txt")
  end

  test "check second entry (nine 8s)" do
    assert "888888888" == Dojo.decode("./lib/entry_2.txt")
  end

end
