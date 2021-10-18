defmodule SilverVine.Token.OAuth2.AuthorizationCodeTest do
  use ExUnit.Case
  doctest SilverVine.Token.OAuth2.AuthorizationCode

  alias SilverVine.Token.OAuth2.AuthorizationCode
  alias KittenBlue.JWK

  @authz_server "https://server.example.com"
  @resource_server "https://resource.example.com"

  @user_id "user_id_12345"
  @client_id "client_id_12345"

  @key [
         "kid20200914",
         "HS256",
         "AyM1SysPpbyDfgZld3umj1qzKObwVMkoqQ+EstJQLr/T+1qS0gZH75aKtMN3Yj0iPS4hcgUuTwjAzZr1Z9CAow"
       ]
       |> JWK.from_compact()

  test "generate, verify" do
    current = System.system_time(:second)
    expiration = 60 * 60

    payload = %{
      "iss" => @authz_server,
      "exp" => current + expiration,
      "aud" => @resource_server,
      "sub" => @user_id,
      "client_id" => @client_id,
      "iat" => current,
      "auth_id" => UUID.uuid4()
    }

    #generate
    assert {:ok, token} = AuthorizationCode.generate(payload, @key)
    [encoded_header, _, _] = String.split(token, ".")
    assert %{"alg" => "HS256", "kid" => "kid20200914", "typ" => "ac+jwt"} == encoded_header |> Base.url_decode64!(padding: false) |> Jason.decode!()

    # verify
    assert {:ok, verified_payload} = AuthorizationCode.verify(token, [@key])
    assert verified_payload == payload |> Map.put("jti", verified_payload["jti"])
  end
end
