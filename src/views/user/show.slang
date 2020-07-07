button
  == link_to("Back To Users", "/users/", class: "btn btn-success btn-sm")
button
  == link_to("Edit Account", "/users/#{user.id}/edit", class: "btn btn-success btn-sm")
button
  == link_to("Delete Account", "/users/#{user.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
hr
h1 Profile
p = user.name
p = user.company
p = user.email
p = user.phone
- if (current_user = context.current_user)
  - if current_user.role == 2
   p
    span class="tag tag-ap#{user.approved}" #{user.approved == 0 ? "Not Approved" : "Approved"}
- if user.about
 p = user.about
- else
hr
h2 Tickets
hr
br
- tickets.each do |t|
  div.ticket-blob
   h3
    a href="/tickets/#{t.id}" = t.title
    span class="tag tag-st#{t.solved}"
     - if t.solved == 0
       | Waiting
     - if t.solved == 1
       | In-Progress
     - if t.solved == 2
       | Resolved
  br
css:
  .tag-ap0 {background:coral}
  .tag-ap1 {background:cornflowerblue}
  .tag-st0 {background:grey}
  .tag-st1 {background:coral}
  .tag-st2 {background:cornflowerblue}
  .ticket-blob {background:#2b3e4e;padding:1px 1rem 1px 1rem;;border-radius:.5em}
