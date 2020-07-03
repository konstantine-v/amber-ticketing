- active = context.request.path == "/" ? "active" : ""
li.nav-item class=active
  a.nav-link href="/" Home
- if (current_user = context.current_user)
  - if current_user.role == 0
    - active = context.request.path == "/tickets" ? "active" : ""
    li.nav-item class=active
     a class="nav-link" href="/tickets" My Tickets
  - else
    - active = context.request.path == "/tickets" ? "active" : ""
    li.nav-item class=active
     a class="nav-link" href="/tickets" Tickets
