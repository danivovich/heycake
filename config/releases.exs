import Config

config :hey_cake, HeyCake.Repo,
  socket_options: [:inet6],
  ssl: false

config :hey_cake, Web.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true

config :hey_cake, HeyCake.Mailer,
  adapter: Bamboo.MailgunAdapter,
  api_key: {:system, "MAILGUN_API_KEY"},
  domain: {:system, "MAILGUN_DOMAIN"},
  hackney_opts: [
    recv_timeout: :timer.minutes(1)
  ]

config :logger, level: :info

config :phoenix, :logger, false

config :porcelain, driver: Porcelain.Driver.Basic

config :stein_phoenix, :views, error_helpers: Web.ErrorHelpers

config :ueberauth, Ueberauth,
  providers: [
    slack: {Ueberauth.Strategy.Slack, []}
  ]
