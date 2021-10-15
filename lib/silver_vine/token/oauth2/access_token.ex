defmodule SilverVine.Token.OAuth2.AccessToken do
  @moduledoc """
  A module to represent OAuth 2.0 Access Token using JWT.
  """

  @behaviour SilverVine.Token.Base

  @jwt_header_typ "at+jwt"

  alias SilverVine.Token

  @doc """
  Generate a token string (JWS) from the Payload map and key information.
  """
  def generate(payload, key = %KittenBlue.JWK{}) do
    Token.generate_token(key, payload, %{"typ" => @jwt_header_typ})
  end
end
