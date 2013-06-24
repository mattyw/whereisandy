defmodule WhereIsAndy.Supervisor do
  use Supervisor.Behaviour

  def start_link(stack) do
    :supervisor.start_link(__MODULE__, stack)
  end


  def init(stack) do
    children = [
      worker(WhereIsAndy.Server, [stack]),
      supervisor(WhereIsAndy.Dynamo, [])
    ]
                  
    supervise children, strategy: :one_for_one
  end

end
