defmodule SilverVine.Token.OAuth2.RefreshToken do
  @moduledoc """
  A module to represent OAuth 2.0 Refresh Token using JWT.
  """

  @behaviour SilverVine.Token.Base

  @jwt_header_typ "rt+jwt"

  alias SilverVine.Token

  @doc """
  Generate a token string (JWS) from the Payload map and key information.

  NOTE: Please validate the Payload before calling this function.
  """
  @spec generate(payload, key) :: {:ok, token} | {:error, term}
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
