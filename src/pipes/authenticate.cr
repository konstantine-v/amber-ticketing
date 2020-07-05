class HTTP::Server::Context
  property current_user : User?
end

class CurrentUser < Amber::Pipe::Base
  def call(context)
    user_id = context.session["user_id"]?
    if user = User.find user_id
      context.current_user = user
    end
    call_next(context)
  end
end

class Authenticate < Amber::Pipe::Base
  def call(context)
    if (current_user = context.current_user) && current_user.approved == 1
      call_next(context)
    else
      context.flash[:warning] = "Please Sign In... If you are signed in, please wait for an admin to approve your account."
      context.response.headers.add "Location", "/signin"
      context.response.status_code = 302
    end
  end
end

class AdminRole < Amber::Pipe::Base
  def call(context)
    if (current_user = context.current_user) && current_user.role == 2
      call_next(context)
    else
      context.flash[:warning] = "Admins only."
      context.response.headers.add "Location", "/"
      context.response.status_code = 302
    end
  end
end
