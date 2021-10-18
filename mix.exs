defmodule SilverVine.Token.MixProject do
  use Mix.Project

  def project do
    [
      app: :silver_vine_token,
      version: "0.1.0",
      elixir: "~> 1.3",
      start_permanent: Mix.env() == :prod,
      description:
        "SilverVine.Token provides functions for implementing various OAuth 2.0 / OpenID Connect tokens using JWT.",
      package: [
        maintainers: ["Ryo Ito"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/ritou/elixir-silver-vine-token"}
      ],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.2"},
      {:kitten_blue, "~> 0.5"},
      {:uuid, "~> 1.1"}

      # for docs
      {:ex_doc, "~> 0.25.3", only: :dev, runtime: false}
    ]
  end
end
