defmodule SilverVine.Token do
  @moduledoc """
  Documentation for `SilverVine.Token`.
  """

  alias KittenBlue.{JWS, JWK}

  @spec generate(key :: JWK.t(), payload :: map, typ :: String.t()) ::
          {:ok, token :: String.t()} | {:error, term}
  def generate(key = %JWK{}, payload = %{}, typ), do: JWS.sign(payload, key, typ_to_map(typ))

  @spec put_jti(payload :: map) :: map()
  def put_jti(payload), do: Map.put(payload, "jti", UUID.uuid4())

  @spec verify(token :: String.t(), keys :: List.t(), typ :: String.t()) :: {:ok, payload :: map}
  def verify(token, keys, typ), do: JWS.verify(token, keys, typ_to_map(typ))

  defp typ_to_map(typ), do: %{"typ" => typ}
end
