th style="text-align:right"
 - if (current_user = context.current_user)
   - active = context.request.path == "/profile" ? "active" : ""
   a.nav-link href="/profile" = current_user.email
   span | |
   a.nav-link href="/signout" Sign Out
 - else
   - active = context.request.path == "/signin" ? "active" : ""
   a.nav-link href="/signin" Sign In
   - active = context.request.path == "/signup" ? "active" : ""
   a.nav-link href="/signup" Sign Up
