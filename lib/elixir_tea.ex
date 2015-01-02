defmodule TEA do
  @delta 0x9e3779b9 # Key schedule constant
  @max   0xFFFFFFFF

  use Bitwise
  import ElixirTea.BinaryUtils

  def encrypt(<<v0 :: uint32, v1 :: uint32>>,
              <<k0 :: uint32, k1 :: uint32,
                k2 :: uint32, k3 :: uint32>>) do

    encrypt 0, v0, v1, k0, k1, k2, k3, 0
  end

  def encrypt(_, _) do
    raise ArgumentError, message: "Invalid arguments."
  end

  defp encrypt(32, v0, v1, _, _, _, _, _) do
    <<v0 :: uint32, v1 :: uint32>>
  end

  defp encrypt(i, v0, v1, k0, k1, k2, k3, sum) do
    sum1 = sum + @delta
    v1k0 = bsl v1, 4 + k0
    v1sum = v1 + sum1
    v1k1 = bsr(v1, 5) + k1
    newv0 = band(v0 + bxor(bxor(v1k0, v1sum), v1k1), @max)

    v0k2 = bsl(newv0, 4 + k2)
    v0sum = newv0 + sum1
    v0k3 = bsr(newv0, 5) + k3
    newv1 = band(v1 + bxor(bxor(v0k2, v0sum), v0k3), @max)

    encrypt(i+1, newv0, newv1, k0, k1, k2, k3, sum1)
  end

  def decrypt(<<v0 :: uint32, v1 :: uint32>>,
              <<k0 :: uint32, k1 :: uint32,
                k2 :: uint32, k3 :: uint32>>) do

    decrypt 0, v0, v1, k0, k1, k2, k3, 0xC6EF3720
  end

  defp decrypt(32, v0, v1, _, _, _, _, _) do
    <<v0 :: uint32, v1 :: uint32 >>
  end

  defp decrypt(i, v0, v1, k0, k1, k2, k3, sum) do
    v0k2 = bsl(v0, 4 + k2)
    v0sum = v0 + sum
    v0k3 = bsr(v0, 5) + k3
    newv1 = band(v1 - band(bxor(bxor(v0k2, v0sum), v0k3), @max), @max)

    v1k0 = bsl(newv1, 4 + k0)
    v1sum = newv1 + sum
    v1k1 = bsr(newv1, 5) + k1
    newv0 = band(v0 - band(bxor(bxor(v1k0, v1sum), v1k1), @max), @max)

    sum1 = sum - @delta

    decrypt(i+1, newv0, newv1, k0, k1, k2, k3, sum1)
  end
end
