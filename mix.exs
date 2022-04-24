defmodule HeyCake.MixProject do
  use Mix.Project

  def project do
    [
      app: :hey_cake,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {HeyCake.Application, []},
      extra_applications: [:logger, :runtime_tools, :ssl]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:bamboo, "~> 2.0"},
      {:bamboo_phoenix, "~> 1.0"},
      {:credo, "~> 1.1", only: [:dev, :test]},
      {:esbuild, "~> 0.2", runtime: Mix.env() == :dev},
      {:gettext, "~> 0.11"},
      {:mojito, "~> 0.6"},
      {:jason, "~> 1.0"},
      {:logster, "~> 1.0"},
      {:phoenix, "~> 1.6.7"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_view, "~> 0.16.4"},
      {:phoenix_live_dashboard, "~> 0.5"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 0.5"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_pubsub, "~> 2.0"},
      {:plug_cowboy, "~> 2.1"},
      {:porcelain, "~> 2.0"},
      {:postgrex, ">= 0.0.0"},
      {:oban, "~> 2.7"},
      {:stein, "~> 0.5"},
      {:stein_phoenix, github: "smartlogic/stein_phoenix", branch: "phoenix_html_3"},
      {:ueberauth_slack, "~> 0.6"},
      {:vapor, "~> 0.8"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "ecto.migrate.reset": ["ecto.drop", "ecto.create", "ecto.migrate"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"],
      "assets.deploy": [
        "cmd --cd assets npm run deploy",
        "esbuild default --minify",
        "phx.digest"
      ]
    ]
  end
end
