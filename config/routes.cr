Amber::Server.configure do
  pipeline :web, :auth, :admin do
    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    # plug Amber::Pipe::PoweredByAmber.new
    # plug Amber::Pipe::ClientIp.new(["X-Forwarded-For"])
    plug Citrine::I18n::Handler.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Amber::Pipe::Flash.new
    plug Amber::Pipe::CSRF.new

    plug CurrentUser.new
  end

  pipeline :auth do
    plug Authenticate.new
  end

  pipeline :admin do
    plug AdminRole.new
  end

  pipeline :api do
    # plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Amber::Pipe::CORS.new
  end

  # All static content will run these transformations
  pipeline :static do
    # plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Static.new("./public")
  end

  routes :web do
    get "/", HomeController, :index

    get "/signin", SessionController, :new
    post "/session", SessionController, :create
    get "/signup", UserController, :new
    post "/registration", UserController, :create
    get "/signout", SessionController, :delete
  end

  routes :admin do
    resources "users", UserController
  end

  routes :auth do
    get "/profile", ProfileController, :show
    get "/profile/edit", ProfileController, :edit
    patch "/profile", ProfileController, :update

    resources "tickets", TicketController

    post "/comments/:id/new", TicketCommentController, :create
    delete "/comments/:id", TicketCommentController, :destroy
  end

  routes :static do
    get "/*", Amber::Controller::Static, :index
  end
end
