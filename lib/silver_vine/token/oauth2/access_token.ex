defmodule SilverVine.Token.OAuth2.AccessToken do
  @moduledoc """
  A module to represent OAuth 2.0 Access Token using JWT.
  """

  @jwt_header_typ "at+jwt"

  @doc """
  Generate a token string (JWS) from the Payload map and key information.
  """
  @spec generate(payload :: map, key :: KittenBlue.JWK.t()) :: {:ok, token_string :: String.t()}
  def generate(payload, key = %KittenBlue.JWK{}) do
    # TODO:
    # 1. validate Payload
    # 2. generate JWS
    "ACCESSTOKENSTRING"
  end
end
