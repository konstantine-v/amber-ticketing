- active = context.request.path == "/" ? "active" : ""
li.nav-item class=active
  a.nav-link href="/" Home
- if (current_user = context.current_user)
  - if current_user.role == 0
    - active = context.request.path == "/tickets" ? "active" : ""
    li.nav-item class=active
     a class="nav-link" href="/tickets" My Tickets
    li.nav-item class="active"
     a.btn.btn-success.btn-sm class="nav-link" href="/tickets/new" New Ticket
  - else
    - active = context.request.path == "/tickets" ? "active" : ""
    li.nav-item class=active
     a class="nav-link" href="/tickets" Tickets
    - active = context.request.path == "/users" ? "active" : ""
    li.nav-item class=active
     a class="nav-link" href="/users" Users
