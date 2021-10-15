defmodule SilverVine.Token.Base do
  @moduledoc """
  Interface definitions commonly implemented for the tokens represented in this library.
  """

  # type
  @type payload :: map
  @type valid_claims :: map
  @type token :: String.t()
  @type key :: KittenBlue.JWK.t()
  @type keys :: List.t()

  # callback
  @callback generate(payload, key) :: {:ok, token} | {:error, term}
  @callback verify(token, keys, valid_claims) :: {:ok, payload} | {:error, term}
end
