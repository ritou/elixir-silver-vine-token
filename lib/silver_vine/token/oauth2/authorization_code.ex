defmodule SilverVine.Token.OAuth2.AuthorizationCode do
  @moduledoc """
  A module to represent OAuth 2.0 Authorization Code using JWT.
  """

  @behaviour SilverVine.Token.Base

  @jwt_header_typ "ac+jwt"

  @doc """
  Generate a token string (JWS) from the Payload map and key information.
  """
  def generate(_payload, _key = %KittenBlue.JWK{}) do
    # TODO:
    # 1. validate Payload
    # 2. generate JWS
    {:ok, "AUTHORIZATIONCODESTRING"}
  end
end
