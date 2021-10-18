defmodule SilverVine.Token do
  @moduledoc """
  SilverVine.Token provides functions for implementing various OAuth 2.0 / OpenID Connect tokens using JWT.

  * OAuth 2.0
  * Access Token : Bearer, DPoP
  * Refresh Token
  * Authorization Code
  * OIDC
  * ID Token (TODO)

  The format of the access token is based on ["JSON Web Token (JWT) Profile for OAuth 2.0 Access Tokens"](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-access-token-jwt), and the Authorization Code/Refresh Token is expressed in JWT in a similar format.

  Using JWT for OAuth tokens does not mean that simple statelessness applies to the use case.
  The ability to handle metadata such as token usage, expiration date, issuer, etc. in the JWT layer will simplify the implementation required for OAuth 2.0 Authorization Server/Resource Server applications.
  """

  alias KittenBlue.{JWS, JWK}

  @spec generate(key :: JWK.t(), payload :: map, typ :: String.t()) ::
          {:ok, token :: String.t()} | {:error, term}
  def generate(key = %JWK{}, payload = %{}, typ), do: JWS.sign(payload, key, typ_to_map(typ))

  @spec put_jti(payload :: map) :: map()
  def put_jti(payload), do: Map.put(payload, "jti", UUID.uuid4())

  @spec verify(token :: String.t(), keys :: list(JWK.t()), typ :: String.t()) ::
          {:ok, payload :: map}
  def verify(token, keys, typ), do: JWS.verify(token, keys, typ_to_map(typ))

  defp typ_to_map(typ), do: %{"typ" => typ}
end
