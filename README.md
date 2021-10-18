# SilverVine.Token

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

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `silver_vine_token` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:silver_vine_token, "~> 0.1"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/silver_vine_token](https://hexdocs.pm/silver_vine_token).

