defmodule SilverVine.TokenTest do
  use ExUnit.Case
  doctest SilverVine.Token

  alias SilverVine.Token
  alias KittenBlue.JWK

  @key [
         "kid20200914",
         "HS256",
         "AyM1SysPpbyDfgZld3umj1qzKObwVMkoqQ+EstJQLr/T+1qS0gZH75aKtMN3Yj0iPS4hcgUuTwjAzZr1Z9CAow"
       ]
       |> JWK.from_compact()

  test "generate_token" do
    payload = %{"foo" => "bar"}
    assert {:ok, token} = Token.generate_token(@key, payload, %{"typ" => "abc"})
    assert %JOSE.JWT{fields: token_payload}  = JOSE.JWT.peek_payload(token)
    assert token_payload == payload
  end

  test "put_jti" do
    assert %{"jti" => _} = Token.put_jti(%{})
    assert %{"jti" => _, "foo" => "bar"} = Token.put_jti(%{"foo" => "bar"})
  end
end
