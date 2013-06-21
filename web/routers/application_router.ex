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
    render conn, "index.html"
  end

  post "/where" do
    if conn.params[:pwd] == @password do
      conn = conn.assign(:location, conn.params[:where])
    end
    redirect conn, to: "/"
  end
end
