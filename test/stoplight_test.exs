defmodule StoplightTest do
  use ExUnit.Case
  doctest Stoplight

  test "greets the world" do
    assert Stoplight.hello() == :world
  end
end
