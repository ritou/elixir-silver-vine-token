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
end
