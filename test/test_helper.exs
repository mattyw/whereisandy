Dynamo.under_test(WhereIsAndy.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule WhereIsAndy.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
