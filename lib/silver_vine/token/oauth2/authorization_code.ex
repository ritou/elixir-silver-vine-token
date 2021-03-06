defmodule SilverVine.Token.OAuth2.AuthorizationCode do
  @moduledoc """
  A module to represent OAuth 2.0 Authorization Code using JWT.
  """

  @behaviour SilverVine.Token.Base

  @jwt_header_typ "ac+jwt"

  alias SilverVine.Token
  alias KittenBlue.JWK

  @doc """
  Generate a token string (JWS) from the Payload map and key information.

  NOTE: Please validate the Payload before calling this function.
  """
  @spec generate(payload :: map, key :: JWK.t()) ::
          {:ok, token :: String.t()} | {:error, term}
  def generate(
        payload = %{
          "iss" => _,
          "exp" => _,
          "aud" => _,
          "sub" => _,
          "client_id" => _,
          "iat" => _,
          "auth_id" => _
        },
        key = %JWK{}
      ),
      do: Token.generate(key, payload |> Token.put_jti(), @jwt_header_typ)

  @doc """
  Verify signature and typ header.
  """
  @spec verify(token :: String.t(), keys :: list(JWK.t())) ::
          {:ok, payload :: map} | {:error, term}
  def verify(token, keys), do: Token.verify(token, keys, @jwt_header_typ)
end
