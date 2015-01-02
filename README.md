TEA
===

[![Build Status](https://travis-ci.org/keichan34/elixir_tea.svg?branch=master)](https://travis-ci.org/keichan34/elixir_tea)

A TEA (Tiny Encryption Algorithm) implemented in pure Elixir.

## Usage

### Encryption

```elixir
text = <<0 :: unsigned-64>>
key  = <<0 :: unsigned-128>>
TEA.encrypt text, key
=> <<65, 234, 58, 10, 148, 186, 169, 64>>
```

### Decryption

```elixir
ciphertext = <<65, 234, 58, 10, 148, 186, 169, 64>>
key        = <<0 :: unsigned-128>>
TEA.decrypt ciphertext, key
=> <<0, 0, 0, 0, 0, 0, 0, 0>>
```
