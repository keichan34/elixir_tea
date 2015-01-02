defmodule TEATest do
  use ExUnit.Case

  test "known-sample encrypt" do
    plaintext = <<0 :: unsigned-64>>
    key = <<0 :: unsigned-128>>

    encrypted = TEA.encrypt plaintext, key
    assert encrypted == <<65, 234, 58, 10, 148, 186, 169, 64>>
  end

  test "known-sample decrypt" do
    encrypted = <<65, 234, 58, 10, 148, 186, 169, 64>>
    key = <<0 :: unsigned-128>>

    plaintext = TEA.decrypt encrypted, key
    assert plaintext == <<0 :: unsigned-64>>
  end
end
