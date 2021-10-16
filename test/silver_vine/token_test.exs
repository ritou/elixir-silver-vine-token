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

  test "generate, verify" do
    payload = %{"foo" => "bar"}

    #generate
    assert {:ok, token} = Token.generate(@key, payload, "abc")
    assert %JOSE.JWT{fields: token_payload} = JOSE.JWT.peek_payload(token)
    assert token_payload == payload
    assert %JOSE.JWS{fields: token_protected} = JOSE.JWT.peek_protected(token)
    assert token_protected["typ"] == "abc"

    # verify
    assert {:ok, payload} == Token.verify(token, [@key], "abc")
    assert {:error, :invalid_jwt_header} == Token.verify(token, [@key], "xyz")
  end

  test "put_jti" do
    assert %{"jti" => _} = Token.put_jti(%{})
    assert %{"jti" => _, "foo" => "bar"} = Token.put_jti(%{"foo" => "bar"})
  end
end
