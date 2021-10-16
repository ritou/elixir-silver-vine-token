defmodule SilverVine.Token.OAuth2.AuthorizationCode do
  @moduledoc """
  A module to represent OAuth 2.0 Authorization Code using JWT.
  """

  @behaviour SilverVine.Token.Base

  @jwt_header_typ "ac+jwt"

  alias SilverVine.Token

  @doc """
  Generate a token string (JWS) from the Payload map and key information.

  NOTE: Please validate the Payload before calling this function.
  """
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
        key = %KittenBlue.JWK{}
      ) do
    Token.generate_token(key, payload, %{"typ" => @jwt_header_typ})
  end
end
