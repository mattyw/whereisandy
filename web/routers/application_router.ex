defmodule ApplicationRouter do
  use Dynamo.Router

  @password "f"

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn.fetch([:cookies, :params])
  end

  # It is common to break your Dynamo in many
  # routers forwarding the requests between them
  # forward "/posts", to: PostsRouter

  get "/" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    #:gen_server.call(self, :new_location)
    location = :gen_server.call(:where_is_andy, :get_location)
    conn = conn.assign(:location, location)
    render conn, "index.html"
  end

  post "/where" do
    if conn.params[:pwd] == @password do
      :gen_server.call(:where_is_andy, {:new_location, conn.params[:where]})
    end
    redirect conn, to: "/"
  end
end

