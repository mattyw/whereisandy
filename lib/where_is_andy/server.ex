defmodule WhereIsAndy.Server do
  use Application.Behaviour

  def start_link(stack) do
    #WhereIsAndy.Supervisor.start_link([])
    :gen_server.start_link({:local, :where_is_andy}, __MODULE__, stack, [])
  end

  def init(start_location) do
    {:ok, start_location}
  end

  def handle_call({:new_location, new_location}, _from, _old_location) do
    {:reply, new_location, new_location}
  end

  def handle_call(:get_location, _from, current_location) do
    {:reply, current_location, current_location}
  end

end
