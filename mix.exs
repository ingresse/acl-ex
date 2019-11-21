defmodule Acl.MixProject do
  use Mix.Project

  def project do
    [
      app: :acl,
      version: "0.1.0",
      build_path: "./_build",
      config_path: "./config/config.exs",
      deps_path: "./deps",
      lockfile: "./mix.lock",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:tesla, "~> 1.2.1"},
      {:jason, "~> 1.1"},
      {:ecto_sql, "~> 3.2"}
    ]
  end
end
