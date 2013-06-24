defmodule WhereIsAndy.Mixfile do
  use Mix.Project

  def project do
    [ app: :where_is_andy,
      version: "0.0.1",
      dynamos: [WhereIsAndy.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/where_is_andy/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { WhereIsAndy, "unknown" } ]
  end

  defp deps do
    [ { :cowboy, %r(.*), github: "extend/cowboy" },
      { :dynamo, "0.1.0.dev", github: "elixir-lang/dynamo" } ]
  end
end
