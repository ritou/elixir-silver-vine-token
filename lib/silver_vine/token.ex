defmodule SilverVine.Token do
  @moduledoc """
  Documentation for `SilverVine.Token`.
  """

  alias KittenBlue.{JWS, JWK}

  @spec generate_token(key :: JWK.t(), payload :: map, header :: map) ::
          {:ok, token :: String.t()} | {:error, term}
  def generate_token(key = %JWK{}, payload = %{}, header = %{}) do
    JWS.sign(payload, key, header)
  end

  @spec put_jti(payload :: map) :: map()
  def put_jti(payload), do: Map.put(payload, "jti", UUID.uuid4())
end
