defmodule WhereIsAndy.Dynamo do
  use Dynamo

  config :dynamo,
    # The environment this Dynamo runs on
    env: Mix.env,

    # The OTP application associated to this Dynamo
    otp_app: :where_is_andy,

    # The endpoint to dispatch requests to
    endpoint: ApplicationRouter,

    # The route from where static assets are served
    # You can turn off static assets by setting it to false
    static_route: "/static"

  # Uncomment the lines below to enable the cookie session store
  # config :dynamo,
  #   session_store: Session.CookieStore,
  #   session_options:
  #     [ key: "_where_is_andy_session",
  #       secret: "QWRwkf9ElfZGmDUa8y4JDRFrmAmZIv9fltC7WHRhO5BsAfAhr0ChiYRhm3/OpKo4"]

  # Default functionality available in templates
  templates do
    use Dynamo.Helpers
  end
end
