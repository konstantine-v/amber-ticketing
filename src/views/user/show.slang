h1 Profile
hr
p
  == link_to("Edit Account", "/users/#{user.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete Account", "/users/#{user.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
hr
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
- tickets.each do |t|
  div.ticket-blob
   p
    span class="tag tag-st#{t.solved}"
     - if t.solved == 0
       | Waiting
     - if t.solved == 1
       | In-Progress
     - if t.solved == 2
       | Resolved
   p
    a href="/tickets/#{t.id}" = t.title
  br
css:
  .tag {color: white; padding: 4px 11px; margin:0 .5rem 0 0; border-radius: .5rem;}
  .tag-ap0 {background:coral}
  .tag-ap1 {background:cornflowerblue}
  .tag-st0 {background:grey}
  .tag-st1 {background:coral}
  .tag-st2 {background:cornflowerblue}
  .ticket-blob {border: 1px solid black; padding: 1rem 1rem 0 1rem; border-radius: .5em;}
